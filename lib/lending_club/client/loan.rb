require 'bigdecimal'

module LendingClub
  class Loan

    ATTRIBUTES = [
      :as_of_date,
      :id,
      :member_id,
      :term,
      :int_rate,
      :exp_default_rate,
      :service_fee_rate,
      :installment,
      :grade,
      :sub_grade,
      :emp_length,
      :home_ownership,
      :annual_inc,
      :is_inc_v,
      :accept_d,
      :exp_d,
      :list_d,
      :credit_pull_d,
      :review_status_d,
      :review_status,
      :desc,
      :purpose,
      :addr_zip,
      :addr_state,
      :investor_count,
      :ils_exp_d,
      :initial_list_status,
      :emp_title,
      :acc_now_delinq,
      :acc_open_past24_mths,
      :bc_open_to_buy,
      :percent_bc_gt75,
      :bc_util,
      :dti,
      :delinq2_yrs,
      :delinq_amnt,
      :earliest_cr_line,
      :fico_range_low,
      :fico_range_high,
      :inq_last6_mths,
      :mths_since_last_delinq,
      :mths_since_last_record,
      :mths_since_recent_inq,
      :mths_since_recent_revol_delinq,
      :mths_since_recent_bc,
      :mort_acc,
      :open_acc,
      :pub_rec,
      :total_bal_ex_mort,
      :revol_bal,
      :revol_util,
      :total_bc_limit,
      :total_acc,
      :total_il_high_credit_limit,
      :num_rev_accts,
      :mths_since_recent_bc_dlq,
      :pub_rec_bankruptcies,
      :num_accts_ever120_ppd,
      :chargeoff_within12_mths,
      :collections12_mths_ex_med,
      :tax_liens,
      :mths_since_last_major_derog,
      :num_sats,
      :num_tl_op_past12m,
      :mo_sin_rcnt_tl,
      :tot_hi_cred_lim,
      :tot_cur_bal,
      :avg_cur_bal,
      :num_bc_tl,
      :num_actv_bc_tl,
      :num_bc_sats,
      :pct_tl_nvr_dlq,
      :num_tl90g_dpd24m,
      :num_tl30dpd,
      :num_tl120dpd2m,
      :num_il_tl,
      :mo_sin_old_il_acct,
      :num_actv_rev_tl,
      :mo_sin_old_rev_tl_op,
      :mo_sin_rcnt_rev_tl_op,
      :total_rev_hi_lim,
      :num_rev_tl_bal_gt0,
      :num_op_rev_tl,
      :tot_coll_amt,
      :funded_amount,
      :loan_amount
    ]

    # @return [String] As of date
    attr_reader :as_of_date
    # @return [Integer] A unique LC assigned ID for the loan listing.
    attr_reader :id
    # @return [Integer] A unique LC assigned Id for the borrower member.
    attr_reader :member_id
    # @return [Integer] The Number of payments on the loan. Values are in
    # months and can be either 36 or 60.
    attr_reader :term
    # @return [Number] Interest Rate on the loan
    attr_reader :int_rate
    # @return [Number] The expected default rate of the loan.
    attr_reader :exp_default_rate
    # @return [Number] Service fee rate paid by the investor for this loan.
    attr_reader :service_fee_rate
    # @return [Number] The monthly payment owed by the borrower if the loan
    # originates.
    attr_reader :installment
    # @return [String] LC assigned loan grade
    attr_reader :grade
    # @return [String] LC assigned loan subgrade
    attr_reader :sub_grade
    # @return [Integer, nil] Employment length in years. Possible values are
    # between 0 and 10 where 0 means less than one year and 10 means ten or
    # more years.
    attr_reader :emp_length
    # @return [String, nil] The home ownership status provided by the
    # borrower during registration. Our values are: RENT, OWN, MORTGAGE, OTHER
    attr_reader :home_ownership
    # @return [Number, nil] The annual income provided by the borrower during
    # registration.
    attr_reader :annual_inc
    # @return [String, nil] Indicates if income is verified by LC
    attr_reader :is_inc_v
    # @return [String] The date which the borrower accepted the offer
    attr_reader :accept_d
    # @return [String] The date the listing will expire
    attr_reader :exp_d
    # @return [String] The date which the borrower's application was listed
    # on the platform.
    attr_reader :list_d
    # @return [String] The date LC pulled credit for this loan
    attr_reader :credit_pull_d
    # @return [String, nil] The date the loan application was reviewed by LC
    attr_reader :review_status_d
    # @return [String] The status of the loan during the listing period.
    # Values: APPROVED, NOT_APPROVED.
    attr_reader :review_status
    # @return [String, nil] Loan description provided by the borrower
    attr_reader :desc
    # @return [String] A category provided by the borrower for the loan
    # request. Values are: DEBT_CONSOLIDATION, MEDICAL, HOME_IMPROVEMENT,
    # RENEWABLE_ENERGY, SMALL_BUSINESS, WEDDING, VACATION, MOVING, HOUSE,
    # CAR, MAJOR_PURCHASE, OTHER
    attr_reader :purpose
    # @return [String, nil] The first 3 numbers of the ZIP code provided
    # by the borrower in the loan application.
    attr_reader :addr_zip
    # @return [String, nil] The address state provided by the borrower
    # during loan application
    attr_reader :addr_state
    # @return [Integer, nil] The Number of investor members who have
    # purchased notes from this loan
    attr_reader :investor_count
    # @return [String] The date and time when the loan will no longer be
    # in the initial listing status. After this date is past, the
    # initialListStatus below will not have any effect and the loan will
    # be treated as a FRACTIONAL loan.
    attr_reader :ils_exp_d
    # @return [String] The initial listing status of the loan.  Possible
    # values are W, F. For more information please read Loan Listing and
    # Whole Loans section.
    attr_reader :initial_list_status
    # @return [String, nil] Employment title
    attr_reader :emp_title
    # @return [Integer, nil] The Number of accounts on which the borrower
    # is now delinquent.
    attr_reader :acc_now_delinq
    # @return [Integer, nil] Number of trades opened in past 24 months.
    attr_reader :acc_open_past24_mths
    # @return [Integer, nil] Total open to buy on revolving bankcards.
    attr_reader :bc_open_to_buy
    # @return [Number, nil] Percentage of all bankcard accounts > 75% of
    # limit.
    attr_reader :percent_bc_gt75
    # @return [Number, nil] Ratio of total current balance to
    # high credit/credit limit for all bankcard accounts.
    attr_reader :bc_util
    # @return [Number, nil] The borrower's debt to income ratio, calculated
    # using the monthly payments on the total debt obligations, excluding
    # mortgage, divided by self-reported monthly income.
    attr_reader :dti
    # @return [Integer, nil] The Number of 30+ days past-due incidences of
    # delinquency in the borrower's credit file for the past 2 years.
    attr_reader :delinq2_yrs
    # @return [Number, nil] The past-due amount owed for the accounts on
    # which the borrower is now delinquent.
    attr_reader :delinq_amnt
    # @return [String, nil] The date the borrower's earliest reported
    # credit line was opened
    attr_reader :earliest_cr_line
    # @return [Integer, nil] The lower boundary of range the borrower's
    # FICO belongs to.
    attr_reader :fico_range_low
    # @return [Integer, nil] The upper boundary of range the borrower's
    # FICO belongs to.
    attr_reader :fico_range_high
    # @return [Integer, nil] The Number of inquiries by creditors during
    # the past 6 months.
    attr_reader :inq_last6_mths
    # @return [Integer, nil] The Number of months since the borrower's
    # last delinquency.
    attr_reader :mths_since_last_delinq
    # @return [Integer, nil] The Number of months since the last public
    # record.
    attr_reader :mths_since_last_record
    # @return [Integer, nil] Months since most recent inquiry.
    attr_reader :mths_since_recent_inq
    # @return [Integer, nil] Months since most recent revolving delinquency.
    attr_reader :mths_since_recent_revol_delinq
    # @return [Integer, nil] Months since most recent bankcard account
    # opened.
    attr_reader :mths_since_recent_bc
    # @return [Integer, nil] Number of mortgage accounts.
    attr_reader :mort_acc
    # @return [Integer, nil] The Number of open credit lines in the
    # borrower's credit file.
    attr_reader :open_acc
    # @return [Integer, nil] Number of derogatory public records.
    attr_reader :pub_rec
    # @return [Integer, nil] Total credit balance excluding mortgage.
    attr_reader :total_bal_ex_mort
    # @return [Number, nil] Total credit revolving balance.
    attr_reader :revol_bal
    # @return [Number, nil] Revolving line utilization rate, or the
    # amount of credit the borrower is using relative to all available
    # revolving credit.
    attr_reader :revol_util
    # @return [Integer, nil] Total bankcard high credit/credit limit.
    attr_reader :total_bc_limit
    # @return [Integer, nil] The total Number of credit lines currently
    # in the borrower's credit file
    attr_reader :total_acc
    # @return [Integer, nil] Total installment high credit/credit limit
    attr_reader :total_il_high_credit_limit
    # @return [Integer, nil] Number of revolving accounts
    attr_reader :num_rev_accts
    # @return [Integer, nil] Months since most recent bankcard delinquency.
    attr_reader :mths_since_recent_bc_dlq
    # @return [Integer, nil] Number of public record bankruptcies.
    attr_reader :pub_rec_bankruptcies
    # @return [Integer, nil] Number of accounts ever 120 or more days past
    #  due.
    attr_reader :num_accts_ever120_ppd
    # @return [Integer, nil] Number of charge-offs within 12 months.
    attr_reader :chargeoff_within12_mths
    # @return [Integer, nil] Number of collections in 12 months excluding
    #  medical collections.
    attr_reader :collections12_mths_ex_med
    # @return [Integer, nil] Number of tax liens
    attr_reader :tax_liens
    # @return [Integer, nil] Months since most recent 90-day or worse
    #  rating.
    attr_reader :mths_since_last_major_derog
    # @return [Integer, nil] Number of satisfactory accounts
    attr_reader :num_sats
    # @return [Integer, nil] Number of accounts opened in past 12 months
    attr_reader :num_tl_op_past12m
    # @return [Integer, nil] Months since most recent account opened
    attr_reader :mo_sin_rcnt_tl
    # @return [Integer, nil] Total high credit/credit limit
    attr_reader :tot_hi_cred_lim
    # @return [Integer, nil] Total current balance of all accounts
    attr_reader :tot_cur_bal
    # @return [Integer, nil] Average current balance of all accounts
    attr_reader :avg_cur_bal
    # @return [Integer, nil] Number of bankcard accounts
    attr_reader :num_bc_tl
    # @return [Integer, nil] Number of currently active bankcard accounts
    attr_reader :num_actv_bc_tl
    # @return [Integer, nil] Number of satisfactory bankcard accounts
    attr_reader :num_bc_sats
    # @return [Integer, nil] Percent of trades never delinquent
    attr_reader :pct_tl_nvr_dlq
    # @return [Integer, nil] Number of accounts 90 or more days past due
    # in last 24 months
    attr_reader :num_tl90g_dpd24m
    # @return [Integer, nil] Number of accounts currently 30 days past
    # due (updated in past 2 months)
    attr_reader :num_tl30dpd
    # @return [Integer, nil] Number of accounts currently 120 days past
    # due (updated in past 2 months)
    attr_reader :num_tl120dpd2m
    # @return [Integer, nil] Number of installment accounts
    attr_reader :num_il_tl
    # @return [Integer, nil] Months since oldest installment account opened
    attr_reader :mo_sin_old_il_acct
    # @return [Integer, nil] Number of currently active revolving trades
    attr_reader :num_actv_rev_tl
    # @return [Integer, nil] Months since oldest revolving account opened
    attr_reader :mo_sin_old_rev_tl_op
    # @return [Integer, nil] Months since most recent revolving account opened
    attr_reader :mo_sin_rcnt_rev_tl_op
    # @return [Integer, nil] Total revolving high credit/credit limit
    attr_reader :total_rev_hi_lim
    # @return [Integer, nil] Number of revolving trades with balance > 0
    attr_reader :num_rev_tl_bal_gt0
    # @return [Integer, nil] Number of open revolving accounts
    attr_reader :num_op_rev_tl
    # @return [Integer, nil] Total collection amounts ever owed
    attr_reader :tot_coll_amt
    # @return [Number] The total amount funded by investors for that loan at
    # that point in time.
    attr_reader :funded_amount
    # @return [Number] The listed amount of the loan applied for by the
    # borrower. If at some point in time, the credit department reduces the
    # loan amount, then it will be reflected in this value.
    attr_reader :loan_amount

    def initialize(data_hash)
      @as_of_date = data_hash['asOfDate'].to_s
      @id = Integer(data_hash['id'])
      @member_id = Integer(data_hash['memberId'])
      @term = Integer(data_hash['term'])
      @int_rate = Float(data_hash['intRate'])
      @exp_default_rate = Float(data_hash['expDefaultRate'])
      @service_fee_rate = Float(data_hash['serviceFeeRate'])
      @installment = Float(data_hash['installment'])
      @grade = data_hash['grade'].to_s
      @sub_grade = data_hash['subGrade'].to_s
      if data_hash['empLength']
        @emp_length = Integer(data_hash['empLength'])
      end
      if data_hash['homeOwnership']
        @home_ownership = data_hash['homeOwnership'].to_s
      end
      if data_hash['annualInc']
        @annual_inc = Float(data_hash['annualInc'])
      end
      if data_hash['isIncV']
        @is_inc_v = data_hash['isIncV'].to_s
      end
      @accept_d = data_hash['acceptD'].to_s
      @exp_d = data_hash['expD'].to_s
      @list_d = data_hash['listD'].to_s
      @credit_pull_d = data_hash['creditPullD'].to_s
      if data_hash['reviewStatusD']
        @review_status_d = data_hash['reviewStatusD'].to_s
      end
      @review_status = data_hash['reviewStatus'].to_s
      if data_hash['desc']
        @desc = data_hash['desc'].to_s
      end
      @purpose = data_hash['purpose'].to_s
      if data_hash['addrZip']
        @addr_zip = data_hash['addrZip'].to_s
      end
      if data_hash['addrState']
        @addr_state = data_hash['addrState'].to_s
      end
      if data_hash['investorCount']
        @investor_count = Integer(data_hash['investorCount'])
      end
      @ils_exp_d = data_hash['ilsExpD'].to_s
      @initial_list_status = data_hash['initialListStatus'].to_s
      if data_hash['empTitle']
        @emp_title = data_hash['empTitle'].to_s
      end
      if data_hash['accNowDelinq']
        @acc_now_delinq = Integer(data_hash['accNowDelinq'])
      end
      if data_hash['accOpenPast24Mths']
        @acc_open_past24_mths = Integer(data_hash['accOpenPast24Mths'])
      end
      if data_hash['bcOpenToBuy']
        @bc_open_to_buy = Integer(data_hash['bcOpenToBuy'])
      end
      if data_hash['percentBcGt75']
        @percent_bc_gt75 = Float(data_hash['percentBcGt75'])
      end
      if data_hash['bcUtil']
        @bc_util = Float(data_hash['bcUtil'])
      end
      if data_hash['dti']
        @dti = Float(data_hash['dti'])
      end
      if data_hash['delinq2Yrs']
        @delinq2_yrs = Integer(data_hash['delinq2Yrs'])
      end
      if data_hash['delinqAmnt']
        @delinq_amnt = Float(data_hash['delinqAmnt'])
      end
      if data_hash['earliestCrLine']
        @earliest_cr_line = data_hash['earliestCrLine'].to_s
      end
      if data_hash['ficoRangeLow']
        @fico_range_low = Integer(data_hash['ficoRangeLow'])
      end
      if data_hash['ficoRangeHigh']
        @fico_range_high = Integer(data_hash['ficoRangeHigh'])
      end
      if data_hash['inqLast6Mths']
        @inq_last6_mths = Integer(data_hash['inqLast6Mths'])
      end
      if data_hash['mthsSinceLastDelinq']
        @mths_since_last_delinq = Integer(data_hash['mthsSinceLastDelinq'])
      end
      if data_hash['mthsSinceLastRecord']
        @mths_since_last_record = Integer(data_hash['mthsSinceLastRecord'])
      end
      if data_hash['mthsSinceRecentInq']
        @mths_since_recent_inq = Integer(data_hash['mthsSinceRecentInq'])
      end
      if data_hash['mthsSinceRecentRevolDelinq']
        @mths_since_recent_revol_delinq = Integer(data_hash['mthsSinceRecentRevolDelinq'])
      end
      if data_hash['mthsSinceRecentBc']
        @mths_since_recent_bc = Integer(data_hash['mthsSinceRecentBc'])
      end
      if data_hash['mortAcc']
        @mort_acc = Integer(data_hash['mortAcc'])
      end
      if data_hash['openAcc']
        @open_acc = Integer(data_hash['openAcc'])
      end
      if data_hash['pubRec']
        @pub_rec = Integer(data_hash['pubRec'])
      end
      if data_hash['totalBalExMort']
        @total_bal_ex_mort = Integer(data_hash['totalBalExMort'])
      end
      if data_hash['revolBal']
        @revol_bal = Float(data_hash['revolBal'])
      end
      if data_hash['revolUtil']
        @revol_util = Float(data_hash['revolUtil'])
      end
      if data_hash['totalBcLimit']
        @total_bc_limit = Integer(data_hash['totalBcLimit'])
      end
      if data_hash['totalAcc']
        @total_acc = Integer(data_hash['totalAcc'])
      end
      if data_hash['totalIlHighCreditLimit']
        @total_il_high_credit_limit = Integer(data_hash['totalIlHighCreditLimit'])
      end
      if data_hash['numRevAccts']
        @num_rev_accts = Integer(data_hash['numRevAccts'])
      end
      if data_hash['mthsSinceRecentBcDlq']
        @mths_since_recent_bc_dlq = Integer(data_hash['mthsSinceRecentBcDlq'])
      end
      if data_hash['pubRecBankruptcies']
        @pub_rec_bankruptcies = Integer(data_hash['pubRecBankruptcies'])
      end
      if data_hash['numAcctsEver120Ppd']
        @num_accts_ever120_ppd = Integer(data_hash['numAcctsEver120Ppd'])
      end
      if data_hash['chargeoffWithin12Mths']
        @chargeoff_within12_mths = Integer(data_hash['chargeoffWithin12Mths'])
      end
      if data_hash['collections12MthsExMed']
        @collections12_mths_ex_med = Integer(data_hash['collections12MthsExMed'])
      end
      if data_hash['taxLiens']
        @tax_liens = Integer(data_hash['taxLiens'])
      end
      if data_hash['mthsSinceLastMajorDerog']
        @mths_since_last_major_derog = Integer(data_hash['mthsSinceLastMajorDerog'])
      end
      if data_hash['numSats']
        @num_sats = Integer(data_hash['numSats'])
      end
      if data_hash['numTlOpPast12m']
        @num_tl_op_past12m = Integer(data_hash['numTlOpPast12m'])
      end
      if data_hash['moSinRcntTl']
        @mo_sin_rcnt_tl = Integer(data_hash['moSinRcntTl'])
      end
      if data_hash['totHiCredLim']
        @tot_hi_cred_lim = Integer(data_hash['totHiCredLim'])
      end
      if data_hash['totCurBal']
        @tot_cur_bal = Integer(data_hash['totCurBal'])
      end
      if data_hash['avgCurBal']
        @avg_cur_bal = Integer(data_hash['avgCurBal'])
      end
      if data_hash['numBcTl']
        @num_bc_tl = Integer(data_hash['numBcTl'])
      end
      if data_hash['numActvBcTl']
        @num_actv_bc_tl = Integer(data_hash['numActvBcTl'])
      end
      if data_hash['numBcSats']
        @num_bc_sats = Integer(data_hash['numBcSats'])
      end
      if data_hash['pctTlNvrDlq']
        @pct_tl_nvr_dlq = Integer(data_hash['pctTlNvrDlq'])
      end
      if data_hash['numTl90gDpd24m']
        @num_tl90g_dpd24m = Integer(data_hash['numTl90gDpd24m'])
      end
      if data_hash['numTl30dpd']
        @num_tl30dpd = Integer(data_hash['numTl30dpd'])
      end
      if data_hash['numTl120dpd2m']
        @num_tl120dpd2m = Integer(data_hash['numTl120dpd2m'])
      end
      if data_hash['numIlTl']
        @num_il_tl = Integer(data_hash['numIlTl'])
      end
      if data_hash['moSinOldIlAcct']
        @mo_sin_old_il_acct = Integer(data_hash['moSinOldIlAcct'])
      end
      if data_hash['numActvRevTl']
        @num_actv_rev_tl = Integer(data_hash['numActvRevTl'])
      end
      if data_hash['moSinOldRevTlOp']
        @mo_sin_old_rev_tl_op = Integer(data_hash['moSinOldRevTlOp'])
      end
      if data_hash['moSinRcntRevTlOp']
        @mo_sin_rcnt_rev_tl_op = Integer(data_hash['moSinRcntRevTlOp'])
      end
      if data_hash['totalRevHiLim']
        @total_rev_hi_lim = Integer(data_hash['totalRevHiLim'])
      end
      if data_hash['numRevTlBalGt0']
        @num_rev_tl_bal_gt0 = Integer(data_hash['numRevTlBalGt0'])
      end
      if data_hash['numOpRevTl']
        @num_op_rev_tl = Integer(data_hash['numOpRevTl'])
      end
      if data_hash['totCollAmt']
        @tot_coll_amt = Integer(data_hash['totCollAmt'])
      end
      @funded_amount = Float(data_hash['fundedAmount'])
      @loan_amount = Float(data_hash['loanAmount'])
    end

    def self.collection(response)
      response['loans'].map do |loan|
        new(loan.merge('asOfDate' => response['asOfDate']))
      end
    end

    def to_h
      ATTRIBUTES.reduce({}) do |h, attribute|
        h[attribute.to_s] = send(attribute)
        h
      end
    end

  end
end
