module NBT
  module Tag
    class String
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        # Tag names are actually TAG_Strings, so yay.
        @payload = NBT::TagName.new.read(io).data
      end

      def self.type_id
        8
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_String#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string(named = true)
        result = binary_type_id
        result += name_to_nbt_string if named
        tag = NBT::TagName.new
        tag.data = @payload
        result + tag.to_binary_s
      end
    end
  end
end
