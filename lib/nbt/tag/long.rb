module NBT
  module Tag
    class Long # signed, per spec
      include NBT::Tag

      type_id 4
      payload_class ::BinData::Int64be
    end
  end
end
