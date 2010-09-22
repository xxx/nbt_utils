module NBT
  module Tag
    attr_reader :name
    attr_reader :payload

    def type
      self.class.type
    end

    def read_name(io)
      # If the length is a real TAG_Short, it's actually supposed to be
      # signed, but this is a length measurement and it better not be negative.
      l = io.read(2).unpack('n').first

      @name = io.read(l)
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