# frozen_string_literal: true

module NBTUtils
  module Tag
    # signed, per spec
    class Int
      include NBTUtils::Tag

      type_id 3
      payload_class ::BinData::Int32be
    end
  end
end
