module NBTUtils
  module Tag
    class Int # signed, per spec
      include NBTUtils::Tag

      type_id 3
      payload_class ::BinData::Int32be
    end
  end
end
