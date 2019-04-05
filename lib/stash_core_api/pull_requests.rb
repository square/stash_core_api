# frozen_string_literal: true

require 'stash_core_api/utils'

module StashCoreAPI
  # Interfaces with pull requests endpoints of Stash CoreAPI API
  module PullRequests
    include StashCoreAPI::Utils

    # @see https://developer.atlassian.com/static/rest/stash/3.9.2/stash-rest.html#idp2785024
    # @authentication Requires basic auth
    # @todo @raise [StashCoreAPI::Error::Unauthorized] Error raised when supplied
    #   user credentials are not valid
    # @param options [Hash] A customizable set of options.
    #
    # @param pull_request_id [Integer] the id of the pull request within the
    #   repository
    # @return [Boolean] Returns true if PR can be merged, false if not.
    def can_merge?(pull_request_id)
      perform_get("/pull-requests/#{pull_request_id}/merge")['canMerge']
    end

    # @see https://developer.atlassian.com/static/rest/stash/3.9.2/stash-rest.html#idp2840064
    # @authentication Requires basic auth
    # @todo @raise [StashCoreAPI::Error::Unauthorized] Error raised when supplied
    #   user credentials are not valid
    # @param options [Hash] A customizable set of options.
    #
    # @param pull_request_id [Integer] the id of the pull request within
    #   the repository
    # @return
    def info(pull_request_id)
      perform_get("/pull-requests/#{pull_request_id}")
    end
  end
end
