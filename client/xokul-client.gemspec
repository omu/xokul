# frozen_string_literal: true

require_relative 'lib/xokul/version'

Gem::Specification.new do |spec|
  spec.name        = 'xokul-client'
  spec.summary     = 'Simple client for the Xokul API'
  spec.description = 'Ruby toolkit for working with the Xokul API'
  spec.version     = Xokul::VERSION

  spec.license = 'MIT'
  
  spec.homepage = 'https://github.com/omu/xokul'
  spec.author   = 'Hüseyin Tekinaslan'
  spec.email    = 'htkaslan@gmail.com'

  spec.files      = Dir['lib/**/*']
  spec.test_files = Dir['test/**/*']

  spec.require_paths         = ['lib']
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')
end
