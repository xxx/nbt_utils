# frozen_string_literal: true

module NBTUtils
  module Tag
    # signed, per spec
    class Short
      include NBTUtils::Tag

      type_id 2
      payload_class ::BinData::Int16be
    end
  end
end
