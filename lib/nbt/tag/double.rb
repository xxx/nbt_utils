module NBT
  module Tag
    class Double # signed, per spec
      include NBT::Tag

      type_id 6

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::DoubleBe.new.read(io)
      end
    end
  end
end
