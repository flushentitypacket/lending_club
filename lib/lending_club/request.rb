require 'lending_club/connection'
require 'lending_club/response'

module LendingClub
  # Defines HTTP request methods
  module Request

    include LendingClub::Connection

    # Perform an HTTP GET request
    def get(path, options={})
      request(:get, path, options)
    end

    private

    # Perform an HTTP request
    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :get
          request.url(path, options)
        else
          # FIXME raise appropriate error here
          raise 'some error'
        end
      end
      return LendingClub::Response.new(response.body)
    end

  end
end
