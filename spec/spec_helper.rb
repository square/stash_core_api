# encoding: utf-8

require 'rspec'
require 'stash_core_api'
require 'webmock/rspec'

RSpec.configure(&:disable_monkey_patching!)

def stub_get(client, path)
  stub_request(:get, scrub(client.stash_url + path))
end

def scrub(path)
  path.gsub(%r{([^:])//}, '\1/')
end

def base_path(client)
  StashCoreAPI::Request::BASE_API_PATH +
    "/projects/#{client.project}/repos/#{client.repository}"
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
