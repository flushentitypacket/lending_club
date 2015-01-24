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

    def order(orders, aid = nil)
      order_collection = OrderCollection.new(orders, aid || investor_id)
      response = post("accounts/#{investor_id}/orders", order_collection.to_h)
      order_collection.update_orders(response)
      order_collection.orders
    end

    def loans(show_all = true)
      parameters = { 'showAll' => show_all ? 'true' : 'false' }
      Loan.collection(get('loans/listing', parameters))
    end

  end
end
