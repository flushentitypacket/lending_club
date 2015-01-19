require 'lending_club/api'
require 'lending_club/client/summary'

module LendingClub
  class Client < API
    def summary
      Summary.new(get('summary'))
    end
  end
end
