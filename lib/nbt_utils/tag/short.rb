module NBTUtils
  module Tag
    class Short # signed, per spec
      include NBTUtils::Tag

      type_id 2
      payload_class ::BinData::Int16be
    end
  end
end
