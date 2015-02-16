require 'bigdecimal'

module LendingClub
  class Order

    ATTRIBUTES = [
      :portfolio_id,
      :loan_id,
      :requested_amount,
      :order_instruct_id,
      :execution_status,
      :invested_amount
    ]

    # @return [Integer, nil] Unique LC assigned id for the portfolio which
    # this note should be assigned if the order is submitted successfully.
    attr_reader :portfolio_id
    # @return [Integer] Unique LC assigned id for the loan. This is the same
    # as the id loan attribute returned in the loanListing result of the
    # LoanBrowseLoans operation.
    attr_reader :loan_id
    # @return [BigDecimal] Amount to be invested in this loan
    attr_reader :requested_amount

    # @return [Integer] A unique LC assigned id identifying the OrderInstruct.
    attr_reader :order_instruct_id
    # @return [String] Indicates the status of the execution.
    attr_reader :execution_status
    # @return [Integer] Actual amount that was invested in this loan.
    attr_reader :invested_amount

    # @private
    attr_writer :execution_status, :invested_amount

    def initialize(loan_id, requested_amount, portfolio_id = nil)
      @loan_id = Integer(loan_id)
      @requested_amount = BigDecimal.new(requested_amount)
      @portfolio_id = Integer(portfolio_id) if portfolio_id
      @execution_status = []
    end

    def fulfilled?
      @execution_status.include?("ORDER_FULFILLED")
    end

    def to_h
      ATTRIBUTES.reduce({}) do |h, attribute|
        h[attribute.to_s] = send(attribute)
        h
      end
    end

  end
end
