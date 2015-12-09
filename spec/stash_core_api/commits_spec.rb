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

  describe '#commits' do
    context 'limit' do
      it 'defaults to 25 if no limit is specified' do
        endpoint = "/#{base_path(client)}/commits"
        stub_get(client, endpoint).to_return(
          body: fixture('commits.json'),
          headers: { 'Content-Type' => 'application/json' }
        )
        commits = client.commits
        expect(commits['size']).to eq(25)
      end

      it 'is the same as number of commits returned' do
        limit = 2
        endpoint = "/#{base_path(client)}/commits?limit=#{limit}"
        stub_get(client, endpoint).to_return(
          body: fixture('commits_with_limit.json'),
          headers: { 'Content-Type' => 'application/json' }
        )
        commits = client.commits(limit: 2)
        expect(commits['size']).to eq(limit)
      end
    end

    context 'with_count' do
      let(:count_keys) { %w( authorCount totalCount ) }

      it 'does not include count keys if with_count is not set' do
        endpoint = "/#{base_path(client)}/commits"
        stub_get(client, endpoint).to_return(
          body: fixture('commits.json'),
          headers: { 'Content-Type' => 'application/json' }
        )
        commits = client.commits
        expect(count_keys - commits.keys).to eq(count_keys)
      end

      it 'includes count keys if with_count is set' do
        endpoint = "/#{base_path(client)}/commits?withCounts=true"
        stub_get(client, endpoint).to_return(
          body: fixture('commits_with_with_count.json'),
          headers: { 'Content-Type' => 'application/json' }
        )
        commits = client.commits(with_counts: true)
        expect(count_keys - commits.keys).to be_empty
      end
    end
  end
end
