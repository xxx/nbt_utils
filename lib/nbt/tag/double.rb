module NBT
  module Tag
    class Double # signed, per spec
      include NBT::Tag

      type_id 6
      payload_class ::BinData::DoubleBe
    end
  end
end
