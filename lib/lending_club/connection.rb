module LendingClub
  # @private
  module Connection

    private

    def connection
      options = {
        :headers => {
          'Accept' => "application/#{format}; charset=utf-8",
          'User-Agent' => user_agent,
          'Authorization' => access_token
          },
        :url => endpoint,
      }

      Faraday::Connection.new(options) do |connection|
        connection.request format
        connection.response format
        connection.adapter Faraday.default_adapter
      end
    end

  end
end
