require 'bigdecimal'

module LendingClub
  class Summary

  def initialize(data_hash)
    @raw = data_hash
  end

  attr_reader :raw

  def investor_id
    raw['investorId']
  end

  # Available cash amount
  def available_cash
    BigDecimal.new(raw['availableCash'])
  end

  # Account total
  def account_total
    BigDecimal.new(raw['accountTotal'])
  end

  # Accrued interest amount
  def accrued_interest
    BigDecimal.new(raw['accruedInterest'])
  end

  # In-Funding balance
  def infunding_balance
    BigDecimal.new(raw['infundingBalance'])
  end

  # Received interest
  def received_interest
    BigDecimal.new(raw['receivedInterest'])
  end

  # Received principal
  def received_principal
    BigDecimal.new(raw['receivedPrincipal'])
  end

  # Received late fees
  def received_late_fees
    BigDecimal.new(raw['receivedLateFees'])
  end

  # Outstanding principal amount
  def outstanding_principal
    BigDecimal.new(raw['outstandingPrincipal'])
  end

  # Total notes
  def total_notes
    raw['totalNotes']
  end

  # Total portfolios
  def total_portfolios
    raw['totalPortfolios']
  end

  end
end
