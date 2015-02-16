require 'bigdecimal'

module LendingClub
  class Summary
    ATTRIBUTES = [
      :available_cash,
      :investor_id,
      :accrued_interest,
      :outstanding_principal,
      :account_total,
      :total_notes,
      :total_portfolios,
      :in_funding_balance,
      :received_interest,
      :received_principal,
      :received_late_fees
    ]

    # @return BigDecimal Available cash amount
    attr_reader :available_cash
    # @return Integer Investor ID
    attr_reader :investor_id
    # @return BigDecimal Accrued interest amount
    attr_reader :accrued_interest
    # @return BigDecimal Outstanding principal amount
    attr_reader :outstanding_principal
    # @return BigDecimal Account total
    attr_reader :account_total
    # @return Integer Total notes
    attr_reader :total_notes
    # @return Integer Total portfolios
    attr_reader :total_portfolios
    # @return BigDecimal In-Funding balance
    attr_reader :in_funding_balance
    # @return BigDecimal Received interest
    attr_reader :received_interest
    # @return BigDecimal Received principal
    attr_reader :received_principal
    # @return [BigDecimal, nil] Received late fees
    attr_reader :received_late_fees

    def initialize(data_hash)
      @available_cash = BigDecimal.new(data_hash['availableCash'])
      @investor_id = Integer(data_hash['investorId'])
      @accrued_interest = BigDecimal.new(data_hash['accruedInterest'])
      @outstanding_principal = BigDecimal.new(data_hash['outstandingPrincipal'])
      @account_total = BigDecimal.new(data_hash['accountTotal'])
      @total_notes = Integer(data_hash['totalNotes'])
      @total_portfolios = Integer(data_hash['totalPortfolios'])
      @in_funding_balance = BigDecimal.new(data_hash['infundingBalance'])
      @received_interest = BigDecimal.new(data_hash['receivedInterest'])
      @received_principal = BigDecimal.new(data_hash['receivedPrincipal'])
      if data_hash['receivedLateFees']
        @received_late_fees = BigDecimal.new(data_hash['receivedLateFees'])
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
