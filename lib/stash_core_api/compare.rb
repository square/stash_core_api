require 'stash_core_api/utils'

module StashCoreAPI
  # Interfaces with compare endpoints of Stash CoreAPI API
  module Compare
    include StashCoreAPI::Utils

    # @see https://docs.atlassian.com/DAC/rest/stash/3.9.2/stash-rest.html#idp3045184
    #
    # @param from [String] the source commit (can be a partial/full changeset
    #   id or qualified/unqualified ref name)
    # @param to [String] the target commit (can be a partial/full changeset
    #   id or qualified/unqualified ref name)
    # @param fromRepo [String] an optional parameter specifying the source
    #   repository containing the source changeset if that changeset is not
    #   present in the current repository; the repository can be specified
    #   by either its ID fromRepo=42 or by its project key plus its repo slug
    #   separated by a slash: fromRepo=projectKey/repoSlug
    # @param limit [Integer] the maximum number of commits to return
    #   Stash defaults to 25
    def compare_changes(from_commit, to_commit, from_repo: nil, limit: nil)
      endpoint = "/compare/changes?from=#{from_commit}&to=#{to_commit}"
      endpoint = "#{endpoint}&fromRepo=#{from_repo}" if from_repo
      endpoint = "#{endpoint}&limit=#{limit}" if limit
      perform_get(endpoint)
    end
  end
end

