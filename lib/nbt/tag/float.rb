module NBT
  module Tag
    class Float # signed, per spec
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::FloatBe.new.read(io)
      end

      def self.type_id
        5
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Float#{@name ? "(\"#{@name}\")" : ''}: #{@payload.value}"
      end

      def to_nbt_string(named = true)
        result = binary_type_id
        result += name_to_nbt_string if named
        result + @payload.to_binary_s
      end
    end
  end
end
