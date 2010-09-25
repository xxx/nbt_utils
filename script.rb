# encoding: UTF-8

require 'bundler'
Bundler.require :default

require File.expand_path('./lib/nbt_utils', File.dirname(__FILE__))
require 'zlib'

@compound = nil

file = NBTUtils::File.new('doc/test.nbt')
@compound = file.read

puts @compound.to_s

@compound.update_tag('name', 'asdf')
puts @compound.to_s

@compound.remove_tag('name')
puts @compound.to_s

#puts @compound.to_nbt_string
#Zlib::GzipWriter.open('lolwut.nbt') do |gz|
#  gz.write @compound.to_nbt_string
#end

@compound = NBTUtils::File.new.read('doc/bigtest.nbt')
puts @compound.to_s

#puts @compound.to_nbt_string
#Zlib::GzipWriter.open('biglolwut.nbt') do |gz|
#  gz.write @compound.to_nbt_string
#end

p @compound.find_tag(/Test/)
p @compound.find_tag('Test')
p @compound.find_tag('intTest')
p @compound.find_tags(/(?:byte|int)Test/)
p @compound.find_tags 'intasdf'