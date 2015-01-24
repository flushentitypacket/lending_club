require 'bigdecimal'

module LendingClub
  class Order

    # @Integer Unique LC assigned id for the portfolio which this note should be assigned if the order is submitted successfully.
    attr_reader :portfolio_id
    # @Integer Unique LC assigned id for the loan. This is the same as the id loan attribute returned in the loanListing result of the LoanBrowseLoans operation.
    attr_reader :loan_id
    # @BigDecimal Amount to be invested in this loan
    attr_reader :requested_amount

    # @Integer A unique LC assigned id identifying the OrderInstruct.
    attr_reader :order_instruct_id
    # @String Indicates the status of the execution.
    attr_reader :execution_status
    # @Integer Actual amount that was invested in this loan.
    attr_reader :invested_amount

    # @private
    attr_writer :execution_status, :invested_amount

    def initialize(portfolio_id, loan_id, requested_amount)
      @portfolio_id = Integer(portfolio_id)
      @loan_id = Integer(loan_id)
      @requested_amount = BigDecimal.new(requested_amount)
      @execution_status = []
    end

    def fulfilled?
      @execution_status.include?("ORDER_FULFILLED")
    end

  end
end
