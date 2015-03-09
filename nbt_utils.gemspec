# -*- encoding: utf-8 -*-
require File.expand_path("../lib/nbt_utils/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "nbt_utils"
  s.version     = NBTUtils::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Michael Dungan']
  s.email       = ['mpd@jesters-court.net']
  s.homepage    = "https://github.com/xxx/nbt_utils"
  s.summary     = "Set of classes to read and write Minecraft .nbt files"
  s.description = "Some classes to read and write Minecraft .nbt files. See http://www.minecraft.net/docs/NBT.txt for format description."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "bindata", "~> 1.3"
  s.add_development_dependency "bundler", ">= 1.0.0"

  s.required_ruby_version = ">= 1.9"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
