require 'bigdecimal'

module LendingClub
  class Loan
    # @String Description
    attr_reader :name
    # @String As of date
    attr_reader :as_of_date
    # @String A unique LC assigned ID for the loan listing.
    attr_reader :id
    # @String A unique LC assigned Id for the borrower member.
    attr_reader :member_id
    # @String The Number of payments on the loan. Values are in months and can be either 36 or 60.
    attr_reader :term
    # @BigDecimal Interest Rate on the loan
    attr_reader :int_rate
    # @BigDecimal The expected default rate of the loan.
    attr_reader :exp_default_rate
    # @BigDecimal Service fee rate paid by the investor for this loan.
    attr_reader :service_fee_rate
    # @BigDecimal The monthly payment owed by the borrower if the loan originates.
    attr_reader :installment
    # @String LC assigned loan grade
    attr_reader :grade
    # @String LC assigned loan subgrade
    attr_reader :sub_grade
    # @String Employment length in years. Possible values are between 0 and 10 where 0 means less than one year and 10 means ten or more years.
    attr_reader :emp_length
    # @String The home ownership status provided by the borrower during registration. Our values are: RENT, OWN, MORTGAGE, OTHER
    attr_reader :home_ownership
    # @BigDecimal The annual income provided by the borrower during registration.
    attr_reader :annual_inc
    # @String Indicates if income is verified by LC
    attr_reader :is_inc_v
    # @String The date which the borrower accepted the offer
    attr_reader :accept_d
    # @String The date the listing will expire
    attr_reader :exp_d
    # @String The date which the borrower's application was listed on the platform.
    attr_reader :list_d
    # @String The date LC pulled credit for this loan
    attr_reader :credit_pull_d
    # @String The date the loan application was reviewed by LC
    attr_reader :review_status_d
    # @String The status of the loan during the listing period. Values: APPROVED, NOT_APPROVED.
    attr_reader :review_status
    # @String Loan description provided by the borrower
    attr_reader :desc
    # @String A category provided by the borrower for the loan request. Values are: DEBT_CONSOLIDATION, MEDICAL, HOME_IMPROVEMENT, RENEWABLE_ENERGY, SMALL_BUSINESS, WEDDING, VACATION, MOVING, HOUSE, CAR, MAJOR_PURCHASE, OTHER
    attr_reader :purpose
    # @String The first 3 numbers of the ZIP code provided by the borrower in the loan application.
    attr_reader :addr_zip
    # @String The address state provided by the borrower during loan application
    attr_reader :addr_state
    # @String The Number of investor members who have purchased notes from this loan
    attr_reader :investor_count
    # @String The date and time when the loan will no longer be in the initial listing status. After this date is past, the initialListStatus below will not have any effect and the loan will be treated as a FRACTIONAL loan.
    attr_reader :ils_exp_d
    # @String The initial listing status of the loan.  Possible values are W, F. For more information please read Loan Listing and Whole Loans section.
    attr_reader :initial_list_status
    # @String Employment title
    attr_reader :emp_title
    # @String The Number of accounts on which the borrower is now delinquent.
    attr_reader :acc_now_delinq
    # @String Number of trades opened in past 24 months.
    attr_reader :acc_open_past24_mths
    # @String Total open to buy on revolving bankcards.
    attr_reader :bc_open_to_buy
    # @BigDecimal Percentage of all bankcard accounts > 75% of limit.
    attr_reader :percent_bc_gt75
    # @BigDecimal Ratio of total current balance to high credit/credit limit for all bankcard accounts.
    attr_reader :bc_util
    # @BigDecimal The borrower's debt to income ratio, calculated using the monthly payments on the total debt obligations, excluding mortgage, divided by self-reported monthly income.
    attr_reader :dti
    # @String The Number of 30+ days past-due incidences of delinquency in the borrower's credit file for the past 2 years.
    attr_reader :delinq2_yrs
    # @BigDecimal The past-due amount owed for the accounts on which the borrower is now delinquent.
    attr_reader :delinq_amnt
    # @String The date the borrower's earliest reported credit line was opened
    attr_reader :earliest_cr_line
    # @String The lower boundary of range the borrower's FICO belongs to.
    attr_reader :fico_range_low
    # @String The upper boundary of range the borrower's FICO belongs to.
    attr_reader :fico_range_high
    # @String The Number of inquiries by creditors during the past 6 months.
    attr_reader :inq_last6_mths
    # @String The Number of months since the borrower's last delinquency.
    attr_reader :mths_since_last_delinq
    # @String The Number of months since the last public record.
    attr_reader :mths_since_last_record
    # @String Months since most recent inquiry.
    attr_reader :mths_since_recent_inq
    # @String Months since most recent revolving delinquency.
    attr_reader :mths_since_recent_revol_delinq
    # @String Months since most recent bankcard account opened.
    attr_reader :mths_since_recent_bc
    # @String Number of mortgage accounts.
    attr_reader :mort_acc
    # @String The Number of open credit lines in the borrower's credit file.
    attr_reader :open_acc
    # @String Number of derogatory public records.
    attr_reader :pub_rec
    # @String Total credit balance excluding mortgage.
    attr_reader :total_bal_ex_mort
    # @BigDecimal Total credit revolving balance.
    attr_reader :revol_bal
    # @BigDecimal Revolving line utilization rate, or the amount of credit the borrower is using relative to all available revolving credit.
    attr_reader :revol_util
    # @String Total bankcard high credit/credit limit.
    attr_reader :total_bc_limit
    # @String The total Number of credit lines currently in the borrower's credit file
    attr_reader :total_acc
    # @String Total installment high credit/credit limit
    attr_reader :total_il_high_credit_limit
    # @String Number of revolving accounts
    attr_reader :num_rev_accts
    # @String Months since most recent bankcard delinquency.
    attr_reader :mths_since_recent_bc_dlq
    # @String Number of public record bankruptcies.
    attr_reader :pub_rec_bankruptcies
    # @String Number of accounts ever 120 or more days past due.
    attr_reader :num_accts_ever120_ppd
    # @String Number of charge-offs within 12 months.
    attr_reader :chargeoff_within12_mths
    # @String Number of collections in 12 months excluding medical collections.
    attr_reader :collections12_mths_ex_med
    # @String Number of tax liens
    attr_reader :tax_liens
    # @String Months since most recent 90-day or worse rating.
    attr_reader :mths_since_last_major_derog
    # @String Number of satisfactory accounts
    attr_reader :num_sats
    # @String Number of accounts opened in past 12 months
    attr_reader :num_tl_op_past12m
    # @String Months since most recent account opened
    attr_reader :mo_sin_rcnt_tl
    # @String Total high credit/credit limit
    attr_reader :tot_hi_cred_lim
    # @String Total current balance of all accounts
    attr_reader :tot_cur_bal
    # @String Average current balance of all accounts
    attr_reader :avg_cur_bal
    # @String Number of bankcard accounts
    attr_reader :num_bc_tl
    # @String Number of currently active bankcard accounts
    attr_reader :num_actv_bc_tl
    # @String Number of satisfactory bankcard accounts
    attr_reader :num_bc_sats
    # @String Percent of trades never delinquent
    attr_reader :pct_tl_nvr_dlq
    # @String Number of accounts 90 or more days past due in last 24 months
    attr_reader :num_tl90g_dpd24m
    # @String Number of accounts currently 30 days past due (updated in past 2 months)
    attr_reader :num_tl30dpd
    # @String Number of accounts currently 120 days past due (updated in past 2 months)
    attr_reader :num_tl120dpd2m
    # @String Number of installment accounts
    attr_reader :num_il_tl
    # @String Months since oldest installment account opened
    attr_reader :mo_sin_old_il_acct
    # @String Number of currently active revolving trades
    attr_reader :num_actv_rev_tl
    # @String Months since oldest revolving account opened
    attr_reader :mo_sin_old_rev_tl_op
    # @String Months since most recent revolving account opened
    attr_reader :mo_sin_rcnt_rev_tl_op
    # @String Total revolving high credit/credit limit
    attr_reader :total_rev_hi_lim
    # @String Number of revolving trades with balance > 0
    attr_reader :num_rev_tl_bal_gt0
    # @String Number of open revolving accounts
    attr_reader :num_op_rev_tl
    # @String Total collection amounts ever owed
    attr_reader :tot_coll_amt
    # @BigDecimal The total amount funded by investors for that loan at that point in time.
    attr_reader :funded_amount
    # @BigDecimal The listed amount of the loan applied for by the borrower. If at some point in time, the credit department reduces the loan amount, then it will be reflected in this value.
    attr_reader :loan_amount

    def self.collection(response)
      response['loans'].map do |loan|
        new(loan.merge('asOfDate' => response['asOfDate']))
      end
    end

    def initialize(data_hash)
      @name = data_hash['Name']
      @as_of_date = data_hash['AsOfDate']
      @id = data_hash['id']
      @member_id = data_hash['memberId']
      @term = data_hash['term']
      @int_rate = data_hash['intRate']
      @exp_default_rate = data_hash['expDefaultRate']
      @service_fee_rate = data_hash['serviceFeeRate']
      @installment = data_hash['installment']
      @grade = data_hash['grade']
      @sub_grade = data_hash['subGrade']
      @emp_length = data_hash['empLength']
      @home_ownership = data_hash['homeOwnership']
      @annual_inc = data_hash['annualInc']
      @is_inc_v = data_hash['isIncV']
      @accept_d = data_hash['acceptD']
      @exp_d = data_hash['expD']
      @list_d = data_hash['listD']
      @credit_pull_d = data_hash['creditPullD']
      @review_status_d = data_hash['reviewStatusD']
      @review_status = data_hash['reviewStatus']
      @desc = data_hash['desc']
      @purpose = data_hash['purpose']
      @addr_zip = data_hash['addrZip']
      @addr_state = data_hash['addrState']
      @investor_count = data_hash['investorCount']
      @ils_exp_d = data_hash['ilsExpD']
      @initial_list_status = data_hash['initialListStatus']
      @emp_title = data_hash['empTitle']
      @acc_now_delinq = data_hash['accNowDelinq']
      @acc_open_past24_mths = data_hash['accOpenPast24Mths']
      @bc_open_to_buy = data_hash['bcOpenToBuy']
      @percent_bc_gt75 = data_hash['percentBcGt75']
      @bc_util = data_hash['bcUtil']
      @dti = data_hash['dti']
      @delinq2_yrs = data_hash['delinq2Yrs']
      @delinq_amnt = data_hash['delinqAmnt']
      @earliest_cr_line = data_hash['earliestCrLine']
      @fico_range_low = data_hash['ficoRangeLow']
      @fico_range_high = data_hash['ficoRangeHigh']
      @inq_last6_mths = data_hash['inqLast6Mths']
      @mths_since_last_delinq = data_hash['mthsSinceLastDelinq']
      @mths_since_last_record = data_hash['mthsSinceLastRecord']
      @mths_since_recent_inq = data_hash['mthsSinceRecentInq']
      @mths_since_recent_revol_delinq = data_hash['mthsSinceRecentRevolDelinq']
      @mths_since_recent_bc = data_hash['mthsSinceRecentBc']
      @mort_acc = data_hash['mortAcc']
      @open_acc = data_hash['openAcc']
      @pub_rec = data_hash['pubRec']
      @total_bal_ex_mort = data_hash['totalBalExMort']
      @revol_bal = data_hash['revolBal']
      @revol_util = data_hash['revolUtil']
      @total_bc_limit = data_hash['totalBcLimit']
      @total_acc = data_hash['totalAcc']
      @total_il_high_credit_limit = data_hash['totalIlHighCreditLimit']
      @num_rev_accts = data_hash['numRevAccts']
      @mths_since_recent_bc_dlq = data_hash['mthsSinceRecentBcDlq']
      @pub_rec_bankruptcies = data_hash['pubRecBankruptcies']
      @num_accts_ever120_ppd = data_hash['numAcctsEver120Ppd']
      @chargeoff_within12_mths = data_hash['chargeoffWithin12Mths']
      @collections12_mths_ex_med = data_hash['collections12MthsExMed']
      @tax_liens = data_hash['taxLiens']
      @mths_since_last_major_derog = data_hash['mthsSinceLastMajorDerog']
      @num_sats = data_hash['numSats']
      @num_tl_op_past12m = data_hash['numTlOpPast12m']
      @mo_sin_rcnt_tl = data_hash['moSinRcntTl']
      @tot_hi_cred_lim = data_hash['totHiCredLim']
      @tot_cur_bal = data_hash['totCurBal']
      @avg_cur_bal = data_hash['avgCurBal']
      @num_bc_tl = data_hash['numBcTl']
      @num_actv_bc_tl = data_hash['numActvBcTl']
      @num_bc_sats = data_hash['numBcSats']
      @pct_tl_nvr_dlq = data_hash['pctTlNvrDlq']
      @num_tl90g_dpd24m = data_hash['numTl90gDpd24m']
      @num_tl30dpd = data_hash['numTl30dpd']
      @num_tl120dpd2m = data_hash['numTl120dpd2m']
      @num_il_tl = data_hash['numIlTl']
      @mo_sin_old_il_acct = data_hash['moSinOldIlAcct']
      @num_actv_rev_tl = data_hash['numActvRevTl']
      @mo_sin_old_rev_tl_op = data_hash['moSinOldRevTlOp']
      @mo_sin_rcnt_rev_tl_op = data_hash['moSinRcntRevTlOp']
      @total_rev_hi_lim = data_hash['totalRevHiLim']
      @num_rev_tl_bal_gt0 = data_hash['numRevTlBalGt0']
      @num_op_rev_tl = data_hash['numOpRevTl']
      @tot_coll_amt = data_hash['totCollAmt']
      @funded_amount = data_hash['fundedAmount']
      @loan_amount = data_hash['loanAmount']
    end

  end
end
