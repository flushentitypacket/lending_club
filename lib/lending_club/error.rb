module LendingClub

  # Generic LendingClub error class
  class Error < StandardError; end

  # Raised when LendingClub returns the HTTP status code 400
  class BadRequest < Error; end

  # Raised when LendingClub returns the HTTP status code 403
  class AuthenticationFailure < Error; end

  # Raised when LendingClub returns the HTTP status code 404
  class NotFound < Error; end

  # Raised when LendingClub returns the HTTP status code 500
  class InternalServerError < Error; end

end
