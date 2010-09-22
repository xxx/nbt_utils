module NBT
  module Tag
    class String
      include NBT::Tag

      def initialize(io, named = true)
        read_name(io) if named

        l = io.read(2).unpack('n').first

        @payload = io.read(l)
      end

      def self.type_id
        8
      end

      def to_s(indent = 0)
        (' ' * indent) + "TAG_String#{@name ? "(\"#{@name}\")" : ''}: #{@payload}"
      end

      def to_nbt_string

      end
    end
  end
end
