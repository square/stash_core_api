require 'spec_helper'

RSpec.describe StashCoreAPI::Error do
  describe '#new' do
    it 'parses out the error message from body' do
      body = { 'errors' => [{ 'message' => 'error' }] }
      error = StashCoreAPI::Error::ClientError.new(body)
      expect(error.message).to eq('error')
    end

    it 'handles an empty hash' do
      error = StashCoreAPI::Error::ClientError.new({})
      expect(error.message).to eq('')
    end

    it 'handles an empty errors' do
      error = StashCoreAPI::Error::ClientError.new('errors' => [])
      expect(error.message).to eq('')
    end

    it 'handles an empty inner message' do
      error = StashCoreAPI::Error::ClientError.new('errors' => [{}])
      expect(error.message).to eq('')
    end
  end
end
