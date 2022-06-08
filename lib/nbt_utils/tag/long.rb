# frozen_string_literal: true

module NBTUtils
  module Tag
    # signed, per spec
    class Long
      include NBTUtils::Tag

      type_id 4
      payload_class ::BinData::Int64be
    end
  end
end
