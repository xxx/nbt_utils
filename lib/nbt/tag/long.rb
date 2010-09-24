module NBT
  module Tag
    class Long # signed, per spec
      include NBT::Tag

      type_id 4

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int64be.new.read(io)
      end
    end
  end
end
