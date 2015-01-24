require 'bigdecimal'

module LendingClub
  class Note

    # @String Loan status
    attr_reader :loan_status
    # @Integer Loan Id
    attr_reader :loan_id
    # @String Portfolio name
    attr_reader :portfolio_name
    # @Integer Note Id
    attr_reader :note_id
    # @String Grade
    attr_reader :grade
    # @BigDecimal Loan amount
    attr_reader :loan_amount
    # @BigDecimal Accrued Interest
    attr_reader :accrued_interest
    # @BigDecimal Note amount
    attr_reader :note_amount
    # @String Purpose
    attr_reader :purpose
    # @Number Interest rate
    attr_reader :interest_rate
    # @Integer Portfolio Id
    attr_reader :portfolio_id
    # @Integer Order Id
    attr_reader :order_id
    # @Integer Loan length
    attr_reader :loan_length
    # @String Issue date
    attr_reader :issue_date
    # @String Order date
    attr_reader :order_date
    # @String Loan status date
    attr_reader :loan_status_date
    # @String Credit trend
    attr_reader :credit_trend
    # @String Current payment status
    attr_reader :current_payment_status
    # @Boolean Can be traded
    attr_reader :can_be_traded
    # @BigDecimal Payments received
    attr_reader :payments_received
    # @String Next payment date
    attr_reader :next_payment_date
    # @BigDecimal Principal pending
    attr_reader :principal_pending
    # @BigDecimal Interest pending
    attr_reader :interest_pending
    # @BigDecimal Interest received
    attr_reader :interest_received
    # @BigDecimal Principal received
    attr_reader :principal_received

    def initialize(data_hash)
      @loan_status = data_hash['loanStatus'].to_s
      @loan_id = Integer(data_hash['loanId'])
      @portfolio_name = data_hash['portfolioName'].to_s
      @note_id = Integer(data_hash['noteId'])
      @grade = data_hash['grade'].to_s
      @loan_amount = BigDecimal.new(data_hash['loanAmount'])
      @accrued_interest = BigDecimal.new(data_hash['accruedInterest'])
      @note_amount = BigDecimal.new(data_hash['noteAmount'])
      @purpose = data_hash['purpose'].to_s
      @interest_rate = Float(data_hash['interestRate'])
      @portfolio_id = Integer(data_hash['portfolioId'])
      @order_id = Integer(data_hash['orderId'])
      @loan_length = Integer(data_hash['loanLength'])
      @issue_date = data_hash['issueDate'].to_s
      @order_date = data_hash['orderDate'].to_s
      @loan_status_date = data_hash['loanStatusDate'].to_s
      @credit_trend = data_hash['creditTrend'].to_s
      @current_payment_status = data_hash['currentPaymentStatus'].to_s
      @can_be_traded = boolean(data_hash['canBeTraded'])
      @payments_received = BigDecimal.new(data_hash['paymentsReceived'])
      @next_payment_date = data_hash['nextPaymentDate'].to_s
      @principal_pending = BigDecimal.new(data_hash['principalPending'])
      @interest_pending = BigDecimal.new(data_hash['interestPending'])
      @interest_received = BigDecimal.new(data_hash['interestReceived'])
      @principal_received = BigDecimal.new(data_hash['principalReceived'])
    end

    def self.collection(data_hash)
      return [] unless data_hash['loans']
      data_hash['loans'].map do |loan|
        new(loan.tap {|h| h['asOfDate'] = data_hash['asOfDate']})
      end
    end

  end
end
