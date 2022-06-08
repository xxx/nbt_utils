# frozen_string_literal: true

require File.expand_path('lib/nbt_utils/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'nbt_utils'
  s.version     = NBTUtils::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Michael Dungan']
  s.email       = ['mpd@jesters-court.net']
  s.homepage    = 'https://github.com/xxx/nbt_utils'
  s.summary     = 'Set of classes to read and write Minecraft .nbt files'
  s.description = 'Some classes to read and write Minecraft .nbt files. '\
                  'See NBT.txt in the /doc directory for format description.'

  s.required_rubygems_version = '>= 1.3.6'

  s.add_dependency 'bindata', '~> 2'
  s.add_development_dependency 'rspec', '~> 3'
  s.add_development_dependency 'rubocop', '~> 1'
  s.add_development_dependency 'rubocop-performance', '~> 1'
  s.add_development_dependency 'rubocop-rspec', '~> 2'

  s.required_ruby_version = '>= 2.7'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").filter_map { |f| f =~ %r{^bin/(.*)} ? Regexp.last_match(1) : nil }
  s.require_path = 'lib'
  s.metadata['rubygems_mfa_required'] = 'true'
end
