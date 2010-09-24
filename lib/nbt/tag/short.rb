module NBT
  module Tag
    class Short # signed, per spec
      include NBT::Tag

      type_id 2

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int16be.new.read(io)
      end
    end
  end
end
