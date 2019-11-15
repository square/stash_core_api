# frozen_string_literal: true

require File.expand_path('lib/stash_core_api/version', __dir__)

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

  gem.add_dependency 'http', '>= 2.2'
end
