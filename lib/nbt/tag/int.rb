module NBT
  module Tag
    class Int # signed, per spec
      include NBT::Tag

      type_id 3

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int32be.new.read(io)
      end
    end
  end
end
