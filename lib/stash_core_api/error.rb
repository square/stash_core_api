# frozen_string_literal: true

module StashCoreAPI
  # Base class for all errors emanating from Stash.
  class Error < StandardError
    # Raised when Stash returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when Stash returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when Stash returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when Stash returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when Stash returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when Stash returns the HTTP status code 405
    MethodNotAllowed = Class.new(ClientError)

    # Raised when Stash returns the HTTP status code 409
    Conflict = Class.new(ClientError)

    # Raised when Stash returns the HTTP status code 415
    UnsupportedMediaType = Class.new(ClientError)

    ERRORS = {
      400 => StashCoreAPI::Error::BadRequest,
      401 => StashCoreAPI::Error::Unauthorized,
      403 => StashCoreAPI::Error::Forbidden,
      404 => StashCoreAPI::Error::NotFound,
      405 => StashCoreAPI::Error::MethodNotAllowed,
      409 => StashCoreAPI::Error::Conflict,
      415 => StashCoreAPI::Error::UnsupportedMediaType,
    }.freeze

    # Initializes a new Error object
    #
    # @param message [Exception, String]
    # @param code [Integer]
    # @return [StashCoreAPI::Error]
    def initialize(body = {})
      message = body.fetch('errors', {}).fetch(0, {}).fetch('message', '')
      super(message)
    end
  end
end
