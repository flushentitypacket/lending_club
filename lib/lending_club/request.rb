require 'lending_club/connection'

module LendingClub
  # Defines HTTP request methods
  module Request

    include LendingClub::Connection

    # Perform an HTTP GET request
    def get(path, options={})
      request(:get, path, options)
    end

    # Perform an HTTP POST request
    def post(path, options={})
      request(:post, path, options)
    end

    private

    # Perform an HTTP request
    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :get
          request.url(path, options)
        when :post
          request.path = path
          request.body = options unless options.empty?
        else
          raise Error.new("Unhandled request method #{method}")
        end
      end
      return response.body
    end

  end
end
