# frozen_string_literal: true

module NBTUtils
  class File
    attr_reader :path, :content, :compressed, :tag

    def initialize(path = nil)
      @path = path
    end

    def read(read_path = path)
      # Zlib does not provide a way to test a file for compressed, and I'm
      # not going to tool around with magic numbers, so I guess we use
      # exceptions for flow control.
      begin
        Zlib::GzipReader.open(read_path) do |f|
          @content = StringIO.new(f.read)
        end
        @compressed = true
      rescue Zlib::GzipFile::Error
        @content = StringIO.new(::File.read(read_path))
        @compressed = false
      end

      last_byte = content.read(1).bytes.first
      klass = NBTUtils::Tag.tag_type_to_class(last_byte)

      @tag = klass.new(content, named: true)
    end

    def write(write_path = path, write_tag = tag, write_compressed = compressed)
      if write_compressed
        Zlib::GzipWriter.open(write_path) do |gz|
          gz.write write_tag.to_nbt_string
        end
      else
        ::File.write(write_path, write_tag.to_nbt_string)
      end
    end
  end
end
