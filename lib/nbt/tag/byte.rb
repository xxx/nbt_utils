module NBT
  module Tag
    class Byte # signed, per spec
      include NBT::Tag

      type_id 1

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int8be.new.read(io)
      end
    end
  end
end
