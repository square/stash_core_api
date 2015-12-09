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

  describe '#can_merge?' do
    let(:pr_id) { 1 }
    let(:endpoint) { "/#{base_path(client)}/pull-requests/#{pr_id}/merge" }

    it 'returns true if pr can be merged' do
      stub_get(client, endpoint).to_return(
        body: fixture('can_merge.json'),
        headers: { 'Content-Type' => 'application/json' }
      )
      expect(client.can_merge?(pr_id)).to be true
    end

    it 'returns false if pr cannot be merged' do
      stub_get(client, endpoint).to_return(
        body: fixture('cannot_merge.json'),
        headers: { 'Content-Type' => 'application/json' }
      )
      expect(client.can_merge?(pr_id)).to be false
    end
  end

  describe '#info' do
    let(:pr_id) { 393 }
    let(:endpoint) { "/#{base_path(client)}/pull-requests/#{pr_id}" }

    it 'returns a JSON hash of body' do
      stub_get(client, endpoint).to_return(
        body: fixture('info.json'),
        headers: { 'Content-Type' => 'application/json' }
      )
      expect(client.info(pr_id)).to eq(JSON.parse(fixture('info.json').read))
    end

    it 'returns expected keys in hash' do
      stub_get(client, endpoint).to_return(
        body: fixture('info.json'),
        headers: { 'Content-Type' => 'application/json' }
      )
      info = client.info(pr_id)
      expected_keys = %w( id version title state open closed createdDate
                          updatedDate fromRef toRef locked author reviewers
                          participants link links )
      expect(info.keys).to eq(expected_keys)
    end

    context 'pull request id' do
      it 'matches id in JSON body' do
        stub_get(client, endpoint).to_return(
          body: fixture('info.json'),
          headers: { 'Content-Type' => 'application/json' }
        )
        info = client.info(pr_id)
        expect(info['id']).to eq(pr_id)
      end
    end
  end
end
