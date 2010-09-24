module NBTUtils
  module Tag
    class Float # signed, per spec
      include NBTUtils::Tag

      type_id 5
      payload_class ::BinData::FloatBe
    end
  end
end
