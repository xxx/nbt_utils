module NBTUtils
  module Tag
    class Double # signed, per spec
      include NBTUtils::Tag

      type_id 6
      payload_class ::BinData::DoubleBe
    end
  end
end
