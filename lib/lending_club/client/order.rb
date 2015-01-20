require 'bigdecimal'

module LendingClub
  class Order

    attr_reader :portfolio_id, :loan_id, :requested_amount

    # @private
    attr_accessor :status, :invested_amount

    def initialize(portfolio_id, loan_id, requested_amount)
      @portfolio_id = portfolio_id
      @loan_id = loan_id
      @requested_amount = BigDecimal.new(requested_amount)
      @status = []
    end

    def fulfilled?
      @status.include?("ORDER_FULFILLED")
    end

  end
end
