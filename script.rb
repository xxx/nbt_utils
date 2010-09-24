# encoding: UTF-8

require 'bundler'
Bundler.require :default

require File.expand_path('./lib/nbt', File.dirname(__FILE__))
require 'zlib'

# Strangely, both test files have an extra null at the end of them, which would be a
# separate TAG_End if it were allowed.

@compound = nil

Zlib::GzipReader.open('doc/test.nbt') do |f|
  # ostensibly this will always be a single TAG_Compound, per the spec
  last_byte = f.read(1).bytes.first
  klass = NBT::Tag.tag_type_to_class(last_byte)

  @compound = klass.new(f, true)
end

puts @compound.to_s

#puts @compound.to_nbt_string
#Zlib::GzipWriter.open('lolwut.nbt') do |gz|
#  gz.write @compound.to_nbt_string
#end

Zlib::GzipReader.open('doc/bigtest.nbt') do |f|
  # ostensibly this will always be a single TAG_Compound, per the spec
  last_byte = f.read(1).bytes.first
  klass = NBT::Tag.tag_type_to_class(last_byte)

  @compound = klass.new(f, true)
end

puts @compound.to_s

#puts @compound.to_nbt_string
#Zlib::GzipWriter.open('biglolwut.nbt') do |gz|
#  gz.write @compound.to_nbt_string
#end

puts @compound.find_tag('Test')
#puts @compound.find_tags(/(?:byte|int)Test/)
#puts @compound.find_tags 'intasdf'