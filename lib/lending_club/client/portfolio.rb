require 'bigdecimal'

module LendingClub
  class Portfolio

    ATTRIBUTES = [
      :portfolio_id,
      :portfolio_name,
      :portfolio_description
    ]

    # @return [Integer] Portfolio Id
    attr_reader :portfolio_id
    # @return [String] Portfolio name
    attr_reader :portfolio_name
    # @return [String, nil] Portfolio description
    attr_reader :portfolio_description

    def initialize(data_hash)
      @portfolio_id = Integer(data_hash['portfolioId'])
      @portfolio_name = data_hash['portfolioName'].to_s
      if data_hash['portfolioDescription']
        @portfolio_description = data_hash['portfolioDescription'].to_s
      end
    end

    def self.collection(data_hash)
      return [] unless data_hash['myPortfolios']
      data_hash['myPortfolios'].map do |portfolio|
        new(portfolio)
      end
    end

    def to_h
      ATTRIBUTES.reduce({}) do |h, attribute|
        h[attribute.to_s] = send(attribute)
        h
      end
    end

  end
end
