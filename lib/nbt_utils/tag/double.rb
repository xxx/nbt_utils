# frozen_string_literal: true

module NBTUtils
  module Tag
    # signed, per spec
    class Double
      include NBTUtils::Tag

      type_id 6
      payload_class ::BinData::DoubleBe
    end
  end
end
