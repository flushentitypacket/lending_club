require 'bigdecimal'

module LendingClub
  class Order

    # @Integer Unique LC assigned id for the portfolio which this note should be assigned if the order is submitted successfully.
    attr_reader :portfolio_id
    # @Integer Unique LC assigned id for the loan. This is the same as the id loan attribute returned in the loanListing result of the LoanBrowseLoans operation.
    attr_reader :loan_id
    # @BigDecimal Amount to be invested in this loan
    attr_reader :requested_amount

    # @private
    attr_accessor :status, :invested_amount

    def initialize(portfolio_id, loan_id, requested_amount)
      @portfolio_id = Integer(portfolio_id)
      @loan_id = Integer(loan_id)
      @requested_amount = BigDecimal.new(requested_amount)
      @status = []
    end

    def fulfilled?
      @status.include?("ORDER_FULFILLED")
    end

  end
end
