require 'lending_club/api'
Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

module LendingClub
  class Client < API

    def summary
      Summary.new(get("accounts/#{investor_id}/summary"))
    end

    def notes
      Note.collection(get("accounts/#{investor_id}/detailednotes"))
    end

    def portfolios
      Portfolio.collection(get("accounts/#{investor_id}/portfolios"))
    end

    def create_portfolio(name, description, aid = nil)
      options = {
        "aid" => aid || investor_id,
        "portfolioName" => name,
        "portfolioDescription" => description
      }
      Portfolio.new(post("accounts/#{investor_id}/portfolios", options))
    end

  end
end
