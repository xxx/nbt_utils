module NBTUtils
  module Tag
    class Compound
      include NBTUtils::Tag

      type_id 10

      def initialize(io, named = true)
        @payload = []
        @tag_names = []
        read_name(io) if named

        until (last_byte = io.read(1).bytes.first) == NBTUtils::Tag::End.type_id
          klass = tag_type_to_class(last_byte)
          add_tag klass.new(io, true)
        end
      end

      def to_s(indent = 0)
        ret = (' ' * indent) + "TAG_Compound#{@name ? "(\"#{@name}\")" : ''}: #{@payload.length} entries\n"
        ret << ((' ' * indent) + "{\n")
        @payload.each do |load|
          ret << "#{load.to_s(indent + 2)}\n"
        end
        ret << ((' ' * indent) + '}')

        ret
      end

      def to_nbt_string(named = true)
        result = named ? binary_type_id + name_to_nbt_string : ''

        result = @payload.inject(result) do |r, load|
          r + load.to_nbt_string(true)
        end

        result + NBTUtils::Tag::End.new(nil).to_nbt_string
      end

      def find_tag(name)
        if name.is_a?(Regexp)
          @payload.detect { |tag| tag.name.to_s =~ /#{name}/ }
        else
          @payload.detect { |tag| tag.name.to_s == name }
        end
      end

      def find_tags(name)
        @payload.select { |tag| tag.name.to_s =~ /#{name}/ }
      end

      def add_tag(tag)
        raise MissingCompoundPayloadTagNameError if tag.name.nil?
        raise DuplicateCompoundPayloadTagNameError if @tag_names.include?(tag.name)

        @tag_names << tag.name
        @payload << tag
      end

      # update one of my tags indirectly
      def update_tag(name, new_value, index = nil)
        tag = find_tag(name)
        tag.set_value(new_value, index)
      end

      # update one of my tags directly. sort of wonky but here to conform to the api.
      def set_value(new_value, index)
        update_tag(index, new_value)
      end

      def remove_tag(name)
        @payload.delete find_tag(name)
      end
    end
  end
end
