# frozen_string_literal: true

module NBTUtils
  module Tag
    class End
      include NBTUtils::Tag

      type_id 0

      def initialize(...)
        @name = ''
      end

      def to_s(...)
        ''
      end

      def to_nbt_string(...)
        binary_type_id
      end
    end
  end
end
