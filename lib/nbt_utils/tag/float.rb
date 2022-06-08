# frozen_string_literal: true

module NBTUtils
  module Tag
    # signed, per spec
    class Float
      include NBTUtils::Tag

      type_id 5
      payload_class ::BinData::FloatBe
    end
  end
end
