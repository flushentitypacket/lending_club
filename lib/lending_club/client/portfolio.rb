require 'bigdecimal'

module LendingClub
  class Portfolio

    def self.collection(data_hash)
      return [] unless data_hash['myPortfolios']
      data_hash['myPortfolios'].map do |portfolio|
        new(portfolio)
      end
    end

    def initialize(data_hash)
      @raw = data_hash
    end

    attr_reader :raw

    # Portfolio Id
    def portfolio_id
      raw['portfolioId']
    end

    # Portfolio name
    def portfolio_name
      raw['portfolioName']
    end

    # Portfolio description
    def portfolio_description
      raw['portfolioDescription']
    end

  end
end
