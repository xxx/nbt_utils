module NBT
  module Tag
    class Int # signed, per spec
      include NBT::Tag

      type_id 3
      payload_class ::BinData::Int32be
    end
  end
end
