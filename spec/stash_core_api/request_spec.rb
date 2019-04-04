# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StashCoreAPI::Request do
  let(:client) do
    StashCoreAPI::Client.new(
      user: 'user',
      pass: 'pass',
      project: 'project',
      repository: 'repository',
      stash_url: 'https://stash.com',
    )
  end

  describe 'error handling' do
    let(:endpoint) { "/#{base_path(client)}/endpoint" }
    let(:request) { StashCoreAPI::Request.new(client, '/endpoint') }

    it 'raises an UnauthorizedError for invalid credentials' do
      stub_get(client, endpoint).to_return(
        body: fixture('unauthorized_error.json'),
        status: 401,
        headers: { 'Content-Type' => 'application/json' },
      )
      expect { request.get }.to raise_error(StashCoreAPI::Error::Unauthorized)
    end
  end
end
