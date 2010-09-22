module NBT
  module Tag
    class ByteArray
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        len = ::BinData::Int32be.new.read(io).value
        @payload = io.read(len).bytes.to_a
      end

      def self.type
        7
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Byte_Array#{@name ? "(\"#{@name}\")" : ''}: [#{@payload.length} bytes]"
      end

      def to_nbt_string

      end
    end
  end
end
