module NBT
  module Tag
    attr_reader :name
    attr_reader :payload

    def self.included(base)
      base.extend ClassMethods
    end

    def initialize(io, named = true)
      read_name(io) if named
      @payload = self.class.payload_class.new.read(io)
    end
    
    def type_id
      self.class.type_id
    end

    def binary_type_id
      # I hope i'm doing this wrong.
      byte = ::BinData::Int8be.new
      byte.value = type_id
      byte.to_binary_s
    end

    def to_s(indent = 0)
      klass = self.class.to_s.split('::').last
      (' ' * indent) + "TAG_#{klass}#{@name ? "(\"#{@name}\")" : ''}: #{@payload.value}"
    end

    def to_nbt_string(named = true)
      result = named ? binary_type_id + name_to_nbt_string : ''
      result + @payload.to_binary_s
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

    module ClassMethods
      def type_id(new_id = nil)
        if new_id
          @type_id = new_id
          NBT::Tag.add_tag_type(new_id, self)
        end

        @type_id
      end

      def payload_class(new_klass = nil)
        @payload_class = new_klass if new_klass
        @payload_class
      end
    end

    def self.tag_type_to_class(tag_type)
      @tag_types[tag_type.to_i]
    end

    protected

    def self.add_tag_type(index, tag_type)
      @tag_types ||= []
      @tag_types[index] = tag_type
    end
  end
end