module LendingClub
  class OrderCollection

    def initialize(orders, aid)
      @orders = orders
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

    private

    # FIXME this relies on loan_id being unique across all orders,
    # which is not enforced anywhere.
    def lookup(loan_id)
      return @orders_map[loan_id] if @orders_map
      @orders_map = {}
      @orders.each {|o| @orders_map[o.loan_id] = o}
      @orders_map[loan_id]
    end

  end
end
