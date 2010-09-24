module NBTUtils
  module Tag
    class Long # signed, per spec
      include NBTUtils::Tag

      type_id 4
      payload_class ::BinData::Int64be
    end
  end
end
