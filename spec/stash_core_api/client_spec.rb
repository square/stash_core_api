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

  describe '#new' do
    it 'takes a hash and returns a StashCoreAPI::Client object' do
      expect(client).to be_a StashCoreAPI::Client
    end
  end
end
