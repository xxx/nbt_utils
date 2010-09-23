module NBT
  module Tag
    attr_reader :name
    attr_reader :payload

    def type_id
      self.class.type_id
    end

    def binary_type_id
      # I hope i'm doing this wrong.
      ::BinData::Int8be.new.read(type_id.chr).to_binary_s
    end

    def read_name(io)
      @name = NBT::TagName.new.read(io).data
    end

    def name_to_nbt_string
      nm = NBT::TagName.new
      nm.data = @name
      nm.to_binary_s
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