module NBT
  module Tag
    class End
      include NBT::Tag

      def initialize(input, named = false)
        @name = ''
      end

      def self.type
        0
      end

      def to_s(indent = 0)
        ''
      end

      def to_nbt_string
        
      end
    end
  end
end