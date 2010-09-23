module NBT
  module Tag
    class Compound
      include NBT::Tag

      def initialize(io, named = true)
        @payload = []
        @tag_names = []
        read_name(io) if named

        until (last_byte = io.read(1).bytes.first) == NBT::Tag::End.type_id
          klass = tag_type_to_class(last_byte)
          add_tag klass.new(io, true)
        end
      end

      def self.type_id
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

      def to_nbt_string(named = true)

      end

      def find_tag(name)
        @payload.detect { |tag| tag.name =~ /#{name}/ }
      end

      def find_tags(name)
        @payload.select { |tag| tag.name =~ /#{name}/ }
      end

      def add_tag(tag)
        raise MissingCompoundPayloadTagNameError if tag.name.nil?
        raise DuplicateCompoundPayloadTagNameError if @tag_names.include?(tag.name)
        @tag_names << tag.name
        @payload << tag
      end
    end
  end
end
