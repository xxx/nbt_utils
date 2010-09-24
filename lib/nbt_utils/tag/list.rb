module NBTUtils
  module Tag
    class List
      include NBTUtils::Tag

      type_id 9

      def initialize(io, named = true)
        @payload = []
        read_name(io) if named

        tag_id = io.read(1).bytes.first.to_i
        @tag_type = NBTUtils::Tag.tag_type_to_class(tag_id)
        len = ::BinData::Int32be.new.read(io).value
        len.times do
          @payload << @tag_type.new(io, false)
        end
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
        result = named ? binary_type_id + name_to_nbt_string : ''
        type =::BinData::Int8be.new
        type.value = @tag_type.type_id
        result += type.to_binary_s
        len = ::BinData::Int32be.new
        len.value = @payload.length
        result += len.to_binary_s
        @payload.inject(result) do |r, load|
          r + load.to_nbt_string(false)
        end
      end
    end
  end
end
