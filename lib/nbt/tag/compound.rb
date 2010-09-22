module NBT
  module Tag
    class Compound
      include NBT::Tag

      def initialize(io, named = true)
        @payload = []
        read_name(io) if named

        until (last_byte = io.read(1)[0]) == NBT::Tag::End.type
          klass = tag_type_to_class(last_byte)
          i = klass.new(io, true)
          @payload << i
        end
      end

      def self.type
        10
      end

      def to_s(indent = 0)
        ret = (' ' * indent) + "TAG_Compound#{@name ? "(\"#{@name}\")" : ''}: #{@payload.length} entries\n"
        ret += (' ' * indent) + "{\n"
        @payload.each do |load|
          ret += "#{load.to_s(indent + 2)}\n"
        end
        ret += (' ' * indent) + "}"

        ret
      end

      def to_nbt_string

      end
    end
  end
end
