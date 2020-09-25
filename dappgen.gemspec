# frozen_string_literal: true

require_relative 'lib/dappgen/version'

Gem::Specification.new do |spec|
  spec.name          = 'dappgen'
  spec.version       = Dappgen::VERSION
  spec.authors       = ['David Siaw']
  spec.email         = ['dsiaw@degica.com']

  spec.summary       = 'Degica App Generator'
  spec.description   = 'Generates Rails apps'
  spec.homepage      = 'https://github.com/degica/dappgen'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/degica/dappgen'
  spec.metadata['changelog_uri'] = 'https://github.com/degica/dappgen'

  spec.files         = Dir['{exe,data,lib}/**/*'] + %w[Gemfile dappgen.gemspec]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'erubis'
  spec.add_dependency 'hashie'
  spec.add_dependency 'optimist'
end
