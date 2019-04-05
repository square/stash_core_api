# frozen_string_literal: true

require 'spec_helper'

RSpec.describe StashCoreAPI::Client do
  let(:client) do
    StashCoreAPI::Client.new(
      user: 'user',
      pass: 'pass',
      project: 'project',
      repository: 'repository',
      stash_url: 'https://stash.com',
    )
  end

  describe '#compare' do
    describe '#changes' do
      it 'should hit the approprate stash api with the given options' do
        endpoint = '/compare/changes?from=a&to=b&fromRepo=c&limit=1'
        expect(client).to receive(:perform_get).with(endpoint)
        client.compare_changes('a', 'b', from_repo: 'c', limit: 1)
      end

      it 'should raise an error when the range is not valid' do
        endpoint = "/#{base_path(client)}/compare/changes?from=c&to=d"
        stub_get(client, endpoint).to_return(
          status: 404,
          body: fixture('compare_changes_bad_range.json'),
          headers: { 'Content-Type' => 'application/json' },
        )
        expect { client.compare_changes('c', 'd') }.to raise_error(
          StashCoreAPI::Error::NotFound, 'Object "c" does not exist in this repository',
        )
      end
    end
  end
end
