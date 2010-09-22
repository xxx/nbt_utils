module NBT
  module Tag
    class Short # signed, per spec
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int16be.new.read(io).value
      end

      def self.type_id
        2
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Short#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string

      end
    end
  end
end
