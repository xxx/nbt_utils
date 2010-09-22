module NBT
  module Tag
    class Float # signed, per spec
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::FloatBe.new.read(io).value
      end

      def self.type
        5
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Float#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string

      end
    end
  end
end
