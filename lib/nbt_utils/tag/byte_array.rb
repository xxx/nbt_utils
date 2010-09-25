module NBTUtils
  module Tag
    class ByteArray
      include NBTUtils::Tag

      type_id 7

      def initialize(io, named = true)
        read_name(io) if named

        len = ::BinData::Int32be.new.read(io).value
        # signedness of the bytes in the array is not defined in the spec.
        @payload = ::BinData::Array.new(:type => :uint8, :initial_length => len).read(io)
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Byte_Array#{@name ? "(\"#{@name}\")" : ''}: [#{@payload.length} bytes]"
      end

      def to_nbt_string(named = true)
        result = named ? binary_type_id + name_to_nbt_string : ''
        len = ::BinData::Int32be.new
        len.value = @payload.length
        result += len.to_binary_s
        result + @payload.to_binary_s
      end

      def set_value(new_value, index)
        b = ::BinData::Uint8.new
        b.value = new_value
        @payload[index] = to_binary_s
      end
    end
  end
end
