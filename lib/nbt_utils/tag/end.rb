module NBTUtils
  module Tag
    class End
      include NBTUtils::Tag

      type_id 0

      def initialize(_input, _named = false)
        @name = ''
      end

      def to_s(_indent = 0)
        ''
      end

      def to_nbt_string(_named = false)
        binary_type_id
      end
    end
  end
end
