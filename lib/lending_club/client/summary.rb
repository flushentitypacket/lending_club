require 'bigdecimal'

module LendingClub
  class Summary

    # @BigDecimal Available cash amount
    attr_reader :available_cash
    # @Integer Investor ID
    attr_reader :investor_id
    # @BigDecimal Accrued interest amount
    attr_reader :accrued_interest
    # @BigDecimal Outstanding principal amount
    attr_reader :outstanding_principal
    # @BigDecimal Account total
    attr_reader :account_total
    # @Integer Total notes
    attr_reader :total_notes
    # @Integer Total portfolios
    attr_reader :total_portfolios
    # @BigDecimal In-Funding balance
    attr_reader :in_funding_balance
    # @BigDecimal Received interest
    attr_reader :received_interest
    # @BigDecimal Received principal
    attr_reader :received_principal
    # @BigDecimal Received late fees
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
      @received_late_fees = BigDecimal.new(data_hash['receivedLateFees'])
    end

  end
end
