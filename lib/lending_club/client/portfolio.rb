require 'bigdecimal'

module LendingClub
  class Portfolio

    # @Integer Portfolio Id
    attr_reader :portfolio_id
    # @String Portfolio name
    attr_reader :portfolio_name
    # @String Portfolio description
    attr_reader :portfolio_description

    def initialize(data_hash)
      @portfolio_id = Integer(data_hash['portfolioId'])
      @portfolio_name = data_hash['portfolioName'].to_s
      @portfolio_description = data_hash['portfolioDescription'].to_s
    end

    def self.collection(data_hash)
      return [] unless data_hash['myPortfolios']
      data_hash['myPortfolios'].map do |portfolio|
        new(portfolio)
      end
    end

  end
end
