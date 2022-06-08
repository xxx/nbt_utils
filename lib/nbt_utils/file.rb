# frozen_string_literal: true

module NBTUtils
  class File
    def initialize(path = nil)
      @path = path
    end

    def read(path = @path)
      # Zlib does not provide a way to test a file for compressed, and I'm
      # not going to tool around with magic numbers, so I guess we use
      # exceptions for flow control.
      begin
        Zlib::GzipReader.open(path) do |f|
          @content = StringIO.new(f.read)
        end
        @compressed = true
      rescue Zlib::GzipFile::Error
        ::File.open(path) do |f|
          @content = StringIO.new(f.read)
        end
        @compressed = false
      end

      last_byte = @content.read(1).bytes.first
      klass = NBTUtils::Tag.tag_type_to_class(last_byte)

      @tag = klass.new(@content, true)
    end

    def write(path = @path, tag = @tag, compressed = @compressed)
      if compressed
        Zlib::GzipWriter.open(path) do |gz|
          gz.write tag.to_nbt_string
        end
      else
        ::File.write(path, tag.to_nbt_string)
      end
    end
  end
end
