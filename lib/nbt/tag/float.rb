module NBT
  module Tag
    class Float # signed, per spec
      include NBT::Tag

      type_id 5

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::FloatBe.new.read(io)
      end
    end
  end
end
