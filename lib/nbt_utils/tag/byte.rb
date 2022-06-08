# frozen_string_literal: true

module NBTUtils
  module Tag
    # signed, per spec
    class Byte
      include NBTUtils::Tag

      type_id 1
      payload_class ::BinData::Int8be
    end
  end
end
