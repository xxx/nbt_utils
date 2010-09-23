module NBT
  module Tag
    class List
      include NBT::Tag

      def initialize(io, named = true)
        @payload = []
        read_name(io) if named

        tag_id = io.read(1).bytes.first.to_i
        @tag_type = NBT::Tag.tag_type_to_class(tag_id)
        len = ::BinData::Int32be.new.read(io).value
        len.times do
          @payload << @tag_type.new(io, false)
        end
      end

      def self.type_id
        9
      end

      def to_s(indent = 0)
        ret = (' ' * indent) + "TAG_List#{@name ? "(\"#{@name}\")" : ''}: #{@payload.length} entries of type TAG_#{@tag_type.to_s.split('::').last}\n"
        ret += (' ' * indent) + "{\n"
        @payload.each do |load|
          ret += "#{load.to_s(indent + 2)}\n"
        end
        ret += (' ' * indent) + "}"
        ret
      end

      def to_nbt_string(named = true)

      end
    end
  end
end
