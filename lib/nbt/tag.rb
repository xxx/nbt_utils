module NBT
  module Tag
    attr_reader :name
    attr_reader :payload

    def type
      self.class.type
    end

    def read_name(io)
      @name = NBT::TagName.new.read(io).data
    end

    def tag_type_to_class(tag_type)
      NBT::Tag.tag_type_to_class(tag_type)
    end

    def self.tag_type_to_class(tag_type)
      [
        NBT::Tag::End,
        NBT::Tag::Byte,
        NBT::Tag::Short,
        NBT::Tag::Int,
        NBT::Tag::Long,
        NBT::Tag::Float,
        NBT::Tag::Double,
        NBT::Tag::ByteArray,
        NBT::Tag::String,
        NBT::Tag::List,
        NBT::Tag::Compound
      ][tag_type.to_i]
    end
  end
end