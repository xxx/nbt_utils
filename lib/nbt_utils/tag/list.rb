# frozen_string_literal: true

module NBTUtils
  module Tag
    class List
      include NBTUtils::Tag

      type_id 9

      attr_reader :tag_type

      def initialize(io, named: true)
        @payload = []
        read_name(io) if named

        tag_id = io.read(1).bytes.first.to_i
        @tag_type = NBTUtils::Tag.tag_type_to_class(tag_id)
        len = ::BinData::Int32be.new.read(io).value
        len.times do
          payload << tag_type.new(io, named: false)
        end
      end

      def to_s(indent = 0)
        ret = "#{' ' * indent}TAG_List#{name ? "(\"#{name}\")" : ''}: #{payload.length} entries of "\
              "type TAG_#{tag_type.to_s.split('::').last}\n"
        ret << ("#{' ' * indent}{\n")
        payload.each do |load|
          ret << "#{load.to_s(indent + 2)}\n"
        end
        ret << ("#{' ' * indent}}")
        ret
      end

      def to_nbt_string(named: true)
        result = named ? binary_type_id + name_to_nbt_string : ''
        type = ::BinData::Int8be.new
        type.value = tag_type.type_id
        result << type.to_binary_s
        len = ::BinData::Int32be.new
        len.value = payload.length
        result << len.to_binary_s
        payload.inject(result) do |r, load|
          r + load.to_nbt_string(named: false)
        end
      end

      def set_value(new_value, index)
        unless new_value.is_a?(NBTUtils::Tag)
          t = tag_type.new
          t.value = new_value
          new_value = t
        end

        payload[index] = new_value
      end
    end
  end
end
