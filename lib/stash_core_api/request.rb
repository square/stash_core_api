# frozen_string_literal: true

require 'http'
require 'json'
require 'stash_core_api/error'

module StashCoreAPI
  # Wrapper around HTTP, does basic auth on every request
  class Request
    BASE_API_PATH = '/rest/api/1.0'

    def initialize(client, endpoint)
      @client = client
      @endpoint = endpoint
    end

    def get
      response = HTTP
                 .basic_auth(user: @client.user, pass: @client.pass)
                 .get(req_url(@endpoint))
      process(response)
    end

    private

    def process(response)
      code = response.code
      body = response.parse

      error = error(code, body)
      raise(error) if error

      body
    end

    def error(code, body)
      klass = StashCoreAPI::Error::ERRORS[code]
      klass&.new(body)
    end

    def req_url(endpoint)
      # build req_url and remove double slashes from it
      project = "/projects/#{@client.project}"
      repo = "/repos/#{@client.repository}"
      url = "#{@client.stash_url}/#{BASE_API_PATH}/#{project}/#{repo}/#{endpoint}"
      url.gsub(%r{([^:])//}, '\1/')
    end
  end
end
