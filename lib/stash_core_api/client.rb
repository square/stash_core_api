require 'stash_core_api/api'
require 'stash_core_api/utils'

module StashCoreAPI
  # Client to interact with Atlassian Stash CoreAPI API
  class Client
    include StashCoreAPI
    include StashCoreAPI::Utils

    attr_accessor :user, :pass, :project, :repository, :stash_url

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return StashCoreAPI::Client
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
