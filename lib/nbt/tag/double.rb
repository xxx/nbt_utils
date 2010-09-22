module NBT
  module Tag
    class Double # signed, per spec
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        @payload = ::BinData::DoubleBe.new.read(io).value
      end

      def self.type_id
        6
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_Double#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string(named = true)

      end
    end
  end
end
