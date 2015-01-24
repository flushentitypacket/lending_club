require 'faraday'

# @private
module FaradayMiddleware
  # @private
  class RaiseHttpException < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 400
          raise LendingClub::BadRequest, response
        when 403
          raise LendingClub::AuthenticationFailure
        when 404
          raise LendingClub::NotFound
        when 500
          raise LendingClub::InternalServerError,
            "Something went wrong. Perhaps you have exceeded the rate limit?"
        end
      end
    end

    def initialize(app)
      super app
      @parser = nil
    end

  end
end
