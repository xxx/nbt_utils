module NBT
  module Tag
    class Long # signed, per spec
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::Int64be.new.read(io).value
      end

      def self.type
        4
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Long#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string

      end
    end
  end
end
