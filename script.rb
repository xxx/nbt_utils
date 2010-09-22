require 'bundler'
Bundler.require :default

require 'lib/nbt'
require 'zlib'

# Strangely, both test files have an extra null at the end of them, which would be a
# separate TAG_End if it were allowed.

@compound = nil

#Zlib::GzipReader.open('test.nbt') do |f|
#  # ostensibly this will always be a single TAG_Compound, per the spec
#  last_byte = f.read(1)[0]
#  klass = NBT::Tag.tag_type_to_class(last_byte)
#
#  @compound = klass.new(f, true)
#end
#
#puts @compound.to_s
#puts

Zlib::GzipReader.open('doc/bigtest.nbt') do |f|
  # ostensibly this will always be a single TAG_Compound, per the spec
  last_byte = f.read(1)[0]
  klass = NBT::Tag.tag_type_to_class(last_byte)

  @compound = klass.new(f, true)
end

puts @compound.to_s

#puts @compound.find_tag('Test')
puts @compound.find_tags(/(?:byte|int)Test/)
puts @compound.find_tags 'intasdf'