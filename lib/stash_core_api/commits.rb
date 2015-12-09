require 'stash_core_api/utils'

module StashCoreAPI
  # Interfaces with commits endpoints of Stash CoreAPI API
  module Commits
    include StashCoreAPI::Utils

    # @see https://developer.atlassian.com/static/rest/stash/3.9.2/stash-rest.html#idp2028464
    #
    # @param path [String] an optional path to filter commits by
    # @param since [String] the commit ID or ref (exclusively) to retrieve
    #   commits after
    # @param until [String] the commit ID (SHA1) or ref (inclusively) to
    #   retrieve commits before if until is unspecified, the tip of the
    #   repository's default branch is assumed
    # @param limit [Integer] the maximum number of commits to return
    #   Stash defaults to 25
    # @param withCounts [Boolean] optionally include the total number of
    #   commits and total number of unique authors
    def commits(path: nil, since: nil, until_: nil, limit: nil,
      with_counts: nil)
      endpoint = '/commits'
      if path || since || until_ || limit || with_counts
        endpoint = "#{endpoint}?"
        endpoint = "#{endpoint}path=#{sanitized_path(path)}&" if path
        endpoint = "#{endpoint}since=#{since}&" if since
        endpoint = "#{endpoint}until=#{until_}&" if until_
        endpoint = "#{endpoint}limit=#{limit}&" if limit
        endpoint = "#{endpoint}withCounts=#{with_counts}&" if with_counts
      end
      perform_get(endpoint)
    end
  end
end
