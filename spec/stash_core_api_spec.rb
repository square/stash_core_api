# encoding: utf-8

require 'spec_helper'
require 'stash_core_api'

RSpec.describe StashCoreAPI do
  it 'should have a VERSION constant' do
    expect(subject.const_get('VERSION')).not_to be_empty
  end
end
