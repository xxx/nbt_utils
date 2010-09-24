module NBT
  module Tag
    class String
      include NBT::Tag

      type_id 8

      def initialize(io, named = true)
        read_name(io) if named

        # Tag names are actually TAG_Strings, so yay.
        @payload = NBT::TagName.new.read(io)
      end
    end
  end
end
