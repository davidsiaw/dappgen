# frozen_string_literal: true

require_relative 'lib/base/version'

Gem::Specification.new do |spec|
  spec.name          = 'base'
  spec.version       = Base::VERSION
  spec.authors       = ['Degica']
  spec.email         = ['dev@degica.com']

  spec.summary       = 'Base gem'
  spec.description   = 'Does not do anything'
  spec.homepage      = 'https://github.com/degica/base'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/degica/base'
  spec.metadata['changelog_uri'] = 'https://github.com/degica/base'

  spec.files         = Dir['{exe,data,lib}/**/*'] + %w[Gemfile base.gemspec]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
