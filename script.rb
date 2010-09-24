# encoding: UTF-8

require 'bundler'
Bundler.require :default

require File.expand_path('./lib/nbt', File.dirname(__FILE__))
require 'zlib'

@compound = nil

file = NBT::File.new('doc/test.nbt')
@compound = file.read

puts @compound.to_s

#puts @compound.to_nbt_string
#Zlib::GzipWriter.open('lolwut.nbt') do |gz|
#  gz.write @compound.to_nbt_string
#end

@compound = NBT::File.new.read('doc/bigtest.nbt')
puts @compound.to_s

#puts @compound.to_nbt_string
#Zlib::GzipWriter.open('biglolwut.nbt') do |gz|
#  gz.write @compound.to_nbt_string
#end

puts @compound.find_tag('Test')
#puts @compound.find_tags(/(?:byte|int)Test/)
#puts @compound.find_tags 'intasdf'