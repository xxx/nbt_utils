# frozen_string_literal: true

module NBTUtils
  module Tag
    class String
      include NBTUtils::Tag

      type_id 8
      payload_class NBTUtils::TagName
    end
  end
end
