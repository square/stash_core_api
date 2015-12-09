# -*- encoding: utf-8 -*-

require File.expand_path('../lib/stash_core_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'stash_core_api'
  gem.version       = StashCoreAPI::VERSION
  gem.summary       = 'Atlassian Stash Core REST API Client'
  gem.description   = 'Make basic auth requests to Stash Core REST API'
  gem.license       = 'Apache-2.0'
  gem.authors       = ['Alyssa Pohahau']
  gem.email         = 'arp@squareup.com'
  gem.homepage      = 'https://rubygems.org/gems/stash_core_api'

  gem.files         = `git ls-files`.split($RS)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '>= 2.0'

  gem.add_dependency 'http', '~> 0.8.12'

  gem.add_development_dependency 'bundler', '~> 1.2'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'webmock', '~> 1.21'
  gem.add_development_dependency 'yard', '~> 0.8'
end
