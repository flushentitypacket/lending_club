module LendingClub
  class OrderCollection

    # @return [Array<Order>] array of Orders
    attr_reader :orders
    # @return [Integer] The member id of the account under management.
    attr_reader :aid

    def initialize(orders, aid)
      @orders = []
      orders.each { |o| add(o) }
      @aid = Integer(aid)
    end

    def to_h
      {
        'aid' => @aid,
        'orders' => @orders.map do |order|
          {
            'loanId' => order.loan_id,
            'requestedAmount' => order.requested_amount,
            'portfolioId' => order.portfolio_id
          }
        end
      }
    end

    def update_orders(response)
      response['orderConfirmations'].each do |confirmation|
        order = lookup(confirmation['loanId'])
        order.order_instruct_id = Integer(confirmation['orderInstructId'])
        order.invested_amount = Integer(confirmation['investedAmount'])
        order.execution_status = confirmation['executionStatus']
      end
      self
    end

    def add(order)
      is_valid, error_message = validate(order)
      raise Error.new(error_message) unless is_valid
      @orders << order
      self
    end

    private

    def validate(order)
      unless order.is_a?(Order)
        return false, 'Each order must be of type Order'
      end

      if @orders.include?(order.loan_id)
        return false, "Order with #{order.loan_id} already exists in collection"
      end

      true
    end

    def lookup(loan_id)
      @orders.detect { |o| o.loan_id == loan_id }
    end

  end
end
