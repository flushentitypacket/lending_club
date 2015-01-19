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
        # TODO maybe this should be some sort of default scope
        :url => "#{endpoint}/accounts/#{investor_id}",
      }

      Faraday::Connection.new(options) do |connection|
        # connection.use FaradayMiddleware::RaiseHttpException
        connection.adapter(adapter)
      end
    end

  end
end
