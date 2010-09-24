module NBTUtils
  class File
    def initialize(path = nil)
      @path = path
    end

    def read(path = @path)
      Zlib::GzipReader.open(path) do |f|
        # ostensibly this will always be a single TAG_Compound, per the spec
        last_byte = f.read(1).bytes.first
        klass = NBTUtils::Tag.tag_type_to_class(last_byte)

        @tag = klass.new(f, true)
      end

      @tag
    end

    def write(path = @path, tag = @tag)
      Zlib::GzipWriter.open(path) do |gz|
        gz.write tag.to_nbt_string
      end
    end
  end
end
