require "pcaprub"
require "time"
require "dashed/packet"

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
      capture.each_packet do |raw_packet|
        packet = Packet.new(raw_packet)
        if packet.host_mac_address == mac_address && !duplicate_arp?
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
      last_press && (last_press - Time.now).abs < @timeout
    end
  end
end
