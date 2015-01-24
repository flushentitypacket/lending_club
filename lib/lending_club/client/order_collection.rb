module LendingClub
  class OrderCollection

    def initialize(orders, aid)
      @orders = []
      orders.each { |o| add(o) }
      @aid = aid
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
        order.status = confirmation['executionStatus']
        # FIXME this is a stupid way of bypassing BigDecimal throwing for not
        # specifying precision for a float value. need to address issue of
        # what kind of object currency values should be stored in.
        order.invested_amount = BigDecimal.new(confirmation['investedAmount'].to_s)
      end
      self
    end

    def add(order)
      is_valid, error_message = validate(order)
      raise error_message unless is_valid
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
