module Dashed
  class Packet
    attr_reader :raw_packet

    def initialize(raw_packet)
      @raw_packet = raw_packet
    end

    def host_mac_address
      raw_packet.
        data.
        unpack("C*").
        map { |i| i.to_s(16) }.
        map { |i| if i.length == 1 then "0#{i}" else i end}.
        slice(6, 6).
        join(":")
    end
  end
end
