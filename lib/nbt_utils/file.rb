module NBTUtils
  class File
    def initialize(path = nil)
      @path = path
    end

    def read(path = @path)
      Zlib::GzipReader.open(path) do |f|
        @content = StringIO.new(f.read)
      end

      last_byte = @content.read(1).bytes.first
      klass = NBTUtils::Tag.tag_type_to_class(last_byte)

      @tag = klass.new(@content, true)
    end

    def write(path = @path, tag = @tag)
      Zlib::GzipWriter.open(path) do |gz|
        gz.write tag.to_nbt_string
      end
    end
  end
end
