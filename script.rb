#!/usr/bin/env ruby

# encoding: UTF-8
# frozen_string_literal: true

require 'bundler'
Bundler.require :default

require File.expand_path('./lib/nbt_utils', File.dirname(__FILE__))
require 'zlib'

@compound = nil

# file = NBTUtils::File.new('doc/test.nbt')
# @compound = file.read
#
# puts @compound.to_s
#
# @compound.update_tag('name', 'asdf')
# puts @compound.to_s
#
# @compound.remove_tag('name')
# puts @compound.to_s

# puts @compound.to_nbt_string
# NBTUtils::File.new.write('biglolwut.nbt', @compound)

# @compound = NBTUtils::File.new.read('doc/bigtest.nbt')
# puts @compound.to_s

@compound = NBTUtils::File.new.read('doc/test.mclevel')
puts @compound.to_s

# puts @compound.to_nbt_string
# NBTUtils::File.new.write('biglolwut.nbt', @compound)

# p @compound.find_tag(/Test/)
# p @compound.find_tag('Test')
# p @compound.find_tag('intTest')
# p @compound.find_tags(/(?:byte|int)Test/)
# p @compound.find_tags 'intasdf'
