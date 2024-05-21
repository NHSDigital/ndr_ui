$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'ndr_ui/version'

unless Gem::Version.new(Gem::VERSION) >= Gem::Version.new('3.0.2')
  # See https://github.com/rubygems/rubygems/pull/2516 for details
  raise 'Please update RubyGems to at least 3.0.2 - lower versions build a broken ndr_ui.gem!'
end

# rubocop:disable Gemspec/DevelopmentDependencies
Gem::Specification.new do |spec|
  spec.name          = 'ndr_ui'
  spec.version       = NdrUi::VERSION
  spec.authors       = ['NDR Development Team']
  spec.email         = []
  spec.summary       = 'NDR UI Rails Engine'
  spec.description   = 'Provides Rails applications with additional support for the ' \
                       'Twitter Bootstrap UI framework'
  spec.homepage      = 'https://github.com/NHSDigital/ndr_ui'
  spec.license       = 'MIT'

  spec.files = Dir['{app,config,lib,vendor}/**/*', 'LICENSE.txt', 'Rakefile',
                   'README.md'] - ['.travis.yml']

  spec.required_ruby_version = '>= 3.0.0'

  spec.add_dependency 'rails', '>= 6.1', '< 7.1'
  spec.add_dependency 'bootstrap', '~> 5.3.3'
  spec.add_dependency 'jquery-rails', '~> 4.6'
  spec.add_dependency 'sprockets', '>= 4.0'
  spec.add_dependency 'sprockets-rails', '>= 3.0.0'
  spec.add_dependency 'dartsass-sprockets'

  # Rails 7.0 and 7.1 do not support sqlite3 2.x; they specify gem "sqlite3", "~> 1.4"
  # in lib/active_record/connection_adapters/sqlite3_adapter.rb
  spec.add_development_dependency 'sqlite3', '~> 1.7'

  spec.add_development_dependency 'mocha', '~> 2.0'
  spec.add_development_dependency 'ndr_dev_support', '>= 6.0'
  spec.add_development_dependency 'net-smtp'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'puma'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov'
end
# rubocop:enable Gemspec/DevelopmentDependencies
