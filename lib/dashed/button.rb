require "pcaprub"
require "time"

module Dashed
  class Button
    TIMEOUT = 45
    SNAPLENGTH = 65535

    attr_accessor :timeout
    attr_reader :last_press, :mac_address

    def initialize(mac_address, interface, timeout = TIMEOUT)
      @mac_address = mac_address
      @interface = interface
      @timeout = timeout
      @last_press = nil
    end

    def on_press
      capture.each_packet do |packet|
        sender_mac = parse_arp_sender_mac(packet)
        if sender_mac == mac_address && !duplicate_arp?
          @last_press = Time.now
          yield if block_given?
        end
      end
    end

    private

    def capture
      return @capture if @capture

      @capture = PCAPRUB::Pcap.open_live(@interface, SNAPLENGTH, true, 0)
      @capture.setfilter("arp")
    end

    def duplicate_arp?
      last_press && (last_press - Time.now).abs < 45
    end

    def parse_arp_sender_mac(packet)
      arp = packet.
        data.
        unpack("C*").
        map { |i| i.to_s(16) }.
        map { |i| if i.length == 1 then "0#{i}" else i end}
      arp.slice(6, 6).join(":")
    end
  end
end
