require 'stash_core_api/request'

module StashCoreAPI
  # Utilities for CoreAPI API modules/classes
  module Utils
    private

    def perform_get(path)
      StashCoreAPI::Request.new(self, path).get
    end

    def sanitized_path(path)
      # strip out any leading '/' which will break the Stash API
      path.sub(/^\/*/, '')
    end
  end
end
