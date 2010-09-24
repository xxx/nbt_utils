module NBT
  module Tag
    class Byte # signed, per spec
      include NBT::Tag

      type_id 1
      payload_class ::BinData::Int8be
    end
  end
end
