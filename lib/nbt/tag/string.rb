module NBT
  module Tag
    class String
      include NBT::Tag

      type_id 8
      payload_class NBT::TagName
    end
  end
end
