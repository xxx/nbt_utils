module NBT
  module Tag
    class Byte # signed, per spec
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int8be.new.read(io).value
      end

      def self.type_id
        1
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Byte#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string

      end
    end
  end
end
