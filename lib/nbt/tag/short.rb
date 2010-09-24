module NBT
  module Tag
    class Short # signed, per spec
      include NBT::Tag

      type_id 2
      payload_class ::BinData::Int16be
    end
  end
end
