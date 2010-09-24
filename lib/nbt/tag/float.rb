module NBT
  module Tag
    class Float # signed, per spec
      include NBT::Tag

      type_id 5
      payload_class ::BinData::FloatBe
    end
  end
end
