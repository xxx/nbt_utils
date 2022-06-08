# frozen_string_literal: true

module NBTUtils
  module Tag
    class IntArray
      include NBTUtils::Tag

      type_id 11

      def initialize(io, named: true)
        read_name(io) if named

        len = ::BinData::Int32be.new.read(io).value

        @payload = ::BinData::Array.new(type: :int32be, initial_length: len).read(io)
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Int_Array#{@name ? "(\"#{@name}\")" : ''}: [#{@payload.length} bytes]"
      end

      def to_nbt_string(named: true)
        result = named ? binary_type_id + name_to_nbt_string : ''
        len = ::BinData::Int32be.new
        len.value = @payload.length
        result << len.to_binary_s
        result + @payload.to_binary_s
      end

      def set_value(new_value, index)
        b = ::BinData::Int32be.new
        b.value = new_value
        @payload[index] = b.to_binary_s
      end
    end
  end
end
