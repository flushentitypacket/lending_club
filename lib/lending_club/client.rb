require 'lending_club/api'
require 'lending_club/client/summary'

module LendingClub
  class Client < API
    def summary
      Summary.new(get("accounts/#{investor_id}/summary"))
    end

  end
end
