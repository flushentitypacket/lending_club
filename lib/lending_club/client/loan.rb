require 'bigdecimal'

module LendingClub
  class Loan
    # @String As of date
    attr_reader :as_of_date
    # @Integer A unique LC assigned ID for the loan listing.
    attr_reader :id
    # @Integer A unique LC assigned Id for the borrower member.
    attr_reader :member_id
    # @Integer The Number of payments on the loan. Values are in months and can be either 36 or 60.
    attr_reader :term
    # @Number Interest Rate on the loan
    attr_reader :int_rate
    # @Number The expected default rate of the loan.
    attr_reader :exp_default_rate
    # @Number Service fee rate paid by the investor for this loan.
    attr_reader :service_fee_rate
    # @Number The monthly payment owed by the borrower if the loan originates.
    attr_reader :installment
    # @String LC assigned loan grade
    attr_reader :grade
    # @String LC assigned loan subgrade
    attr_reader :sub_grade
    # @Integer Employment length in years. Possible values are between 0 and 10 where 0 means less than one year and 10 means ten or more years.
    attr_reader :emp_length
    # @String The home ownership status provided by the borrower during registration. Our values are: RENT, OWN, MORTGAGE, OTHER
    attr_reader :home_ownership
    # @Number The annual income provided by the borrower during registration.
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
    # @Integer The Number of investor members who have purchased notes from this loan
    attr_reader :investor_count
    # @String The date and time when the loan will no longer be in the initial listing status. After this date is past, the initialListStatus below will not have any effect and the loan will be treated as a FRACTIONAL loan.
    attr_reader :ils_exp_d
    # @String The initial listing status of the loan.  Possible values are W, F. For more information please read Loan Listing and Whole Loans section.
    attr_reader :initial_list_status
    # @String Employment title
    attr_reader :emp_title
    # @Integer The Number of accounts on which the borrower is now delinquent.
    attr_reader :acc_now_delinq
    # @Integer Number of trades opened in past 24 months.
    attr_reader :acc_open_past24_mths
    # @Integer Total open to buy on revolving bankcards.
    attr_reader :bc_open_to_buy
    # @Number Percentage of all bankcard accounts > 75% of limit.
    attr_reader :percent_bc_gt75
    # @Number Ratio of total current balance to high credit/credit limit for all bankcard accounts.
    attr_reader :bc_util
    # @Number The borrower's debt to income ratio, calculated using the monthly payments on the total debt obligations, excluding mortgage, divided by self-reported monthly income.
    attr_reader :dti
    # @Integer The Number of 30+ days past-due incidences of delinquency in the borrower's credit file for the past 2 years.
    attr_reader :delinq2_yrs
    # @Number The past-due amount owed for the accounts on which the borrower is now delinquent.
    attr_reader :delinq_amnt
    # @String The date the borrower's earliest reported credit line was opened
    attr_reader :earliest_cr_line
    # @Integer The lower boundary of range the borrower's FICO belongs to.
    attr_reader :fico_range_low
    # @Integer The upper boundary of range the borrower's FICO belongs to.
    attr_reader :fico_range_high
    # @Integer The Number of inquiries by creditors during the past 6 months.
    attr_reader :inq_last6_mths
    # @Integer The Number of months since the borrower's last delinquency.
    attr_reader :mths_since_last_delinq
    # @Integer The Number of months since the last public record.
    attr_reader :mths_since_last_record
    # @Integer Months since most recent inquiry.
    attr_reader :mths_since_recent_inq
    # @Integer Months since most recent revolving delinquency.
    attr_reader :mths_since_recent_revol_delinq
    # @Integer Months since most recent bankcard account opened.
    attr_reader :mths_since_recent_bc
    # @Integer Number of mortgage accounts.
    attr_reader :mort_acc
    # @Integer The Number of open credit lines in the borrower's credit file.
    attr_reader :open_acc
    # @Integer Number of derogatory public records.
    attr_reader :pub_rec
    # @Integer Total credit balance excluding mortgage.
    attr_reader :total_bal_ex_mort
    # @Number Total credit revolving balance.
    attr_reader :revol_bal
    # @Number Revolving line utilization rate, or the amount of credit the borrower is using relative to all available revolving credit.
    attr_reader :revol_util
    # @Integer Total bankcard high credit/credit limit.
    attr_reader :total_bc_limit
    # @Integer The total Number of credit lines currently in the borrower's credit file
    attr_reader :total_acc
    # @Integer Total installment high credit/credit limit
    attr_reader :total_il_high_credit_limit
    # @Integer Number of revolving accounts
    attr_reader :num_rev_accts
    # @Integer Months since most recent bankcard delinquency.
    attr_reader :mths_since_recent_bc_dlq
    # @Integer Number of public record bankruptcies.
    attr_reader :pub_rec_bankruptcies
    # @Integer Number of accounts ever 120 or more days past due.
    attr_reader :num_accts_ever120_ppd
    # @Integer Number of charge-offs within 12 months.
    attr_reader :chargeoff_within12_mths
    # @Integer Number of collections in 12 months excluding medical collections.
    attr_reader :collections12_mths_ex_med
    # @Integer Number of tax liens
    attr_reader :tax_liens
    # @Integer Months since most recent 90-day or worse rating.
    attr_reader :mths_since_last_major_derog
    # @Integer Number of satisfactory accounts
    attr_reader :num_sats
    # @Integer Number of accounts opened in past 12 months
    attr_reader :num_tl_op_past12m
    # @Integer Months since most recent account opened
    attr_reader :mo_sin_rcnt_tl
    # @Integer Total high credit/credit limit
    attr_reader :tot_hi_cred_lim
    # @Integer Total current balance of all accounts
    attr_reader :tot_cur_bal
    # @Integer Average current balance of all accounts
    attr_reader :avg_cur_bal
    # @Integer Number of bankcard accounts
    attr_reader :num_bc_tl
    # @Integer Number of currently active bankcard accounts
    attr_reader :num_actv_bc_tl
    # @Integer Number of satisfactory bankcard accounts
    attr_reader :num_bc_sats
    # @Integer Percent of trades never delinquent
    attr_reader :pct_tl_nvr_dlq
    # @Integer Number of accounts 90 or more days past due in last 24 months
    attr_reader :num_tl90g_dpd24m
    # @Integer Number of accounts currently 30 days past due (updated in past 2 months)
    attr_reader :num_tl30dpd
    # @Integer Number of accounts currently 120 days past due (updated in past 2 months)
    attr_reader :num_tl120dpd2m
    # @Integer Number of installment accounts
    attr_reader :num_il_tl
    # @Integer Months since oldest installment account opened
    attr_reader :mo_sin_old_il_acct
    # @Integer Number of currently active revolving trades
    attr_reader :num_actv_rev_tl
    # @Integer Months since oldest revolving account opened
    attr_reader :mo_sin_old_rev_tl_op
    # @Integer Months since most recent revolving account opened
    attr_reader :mo_sin_rcnt_rev_tl_op
    # @Integer Total revolving high credit/credit limit
    attr_reader :total_rev_hi_lim
    # @Integer Number of revolving trades with balance > 0
    attr_reader :num_rev_tl_bal_gt0
    # @Integer Number of open revolving accounts
    attr_reader :num_op_rev_tl
    # @Integer Total collection amounts ever owed
    attr_reader :tot_coll_amt
    # @Number The total amount funded by investors for that loan at that point in time.
    attr_reader :funded_amount
    # @Number The listed amount of the loan applied for by the borrower. If at some point in time, the credit department reduces the loan amount, then it will be reflected in this value.
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
      @emp_length = Integer(data_hash['empLength'])
      @home_ownership = data_hash['homeOwnership'].to_s
      @annual_inc = Float(data_hash['annualInc'])
      @is_inc_v = data_hash['isIncV'].to_s
      @accept_d = data_hash['acceptD'].to_s
      @exp_d = data_hash['expD'].to_s
      @list_d = data_hash['listD'].to_s
      @credit_pull_d = data_hash['creditPullD'].to_s
      @review_status_d = data_hash['reviewStatusD'].to_s
      @review_status = data_hash['reviewStatus'].to_s
      @desc = data_hash['desc'].to_s
      @purpose = data_hash['purpose'].to_s
      @addr_zip = data_hash['addrZip'].to_s
      @addr_state = data_hash['addrState'].to_s
      @investor_count = Integer(data_hash['investorCount'])
      @ils_exp_d = data_hash['ilsExpD'].to_s
      @initial_list_status = data_hash['initialListStatus'].to_s
      @emp_title = data_hash['empTitle'].to_s
      @acc_now_delinq = Integer(data_hash['accNowDelinq'])
      @acc_open_past24_mths = Integer(data_hash['accOpenPast24Mths'])
      @bc_open_to_buy = Integer(data_hash['bcOpenToBuy'])
      @percent_bc_gt75 = Float(data_hash['percentBcGt75'])
      @bc_util = Float(data_hash['bcUtil'])
      @dti = Float(data_hash['dti'])
      @delinq2_yrs = Integer(data_hash['delinq2Yrs'])
      @delinq_amnt = Float(data_hash['delinqAmnt'])
      @earliest_cr_line = data_hash['earliestCrLine'].to_s
      @fico_range_low = Integer(data_hash['ficoRangeLow'])
      @fico_range_high = Integer(data_hash['ficoRangeHigh'])
      @inq_last6_mths = Integer(data_hash['inqLast6Mths'])
      @mths_since_last_delinq = Integer(data_hash['mthsSinceLastDelinq'])
      @mths_since_last_record = Integer(data_hash['mthsSinceLastRecord'])
      @mths_since_recent_inq = Integer(data_hash['mthsSinceRecentInq'])
      @mths_since_recent_revol_delinq = Integer(data_hash['mthsSinceRecentRevolDelinq'])
      @mths_since_recent_bc = Integer(data_hash['mthsSinceRecentBc'])
      @mort_acc = Integer(data_hash['mortAcc'])
      @open_acc = Integer(data_hash['openAcc'])
      @pub_rec = Integer(data_hash['pubRec'])
      @total_bal_ex_mort = Integer(data_hash['totalBalExMort'])
      @revol_bal = Float(data_hash['revolBal'])
      @revol_util = Float(data_hash['revolUtil'])
      @total_bc_limit = Integer(data_hash['totalBcLimit'])
      @total_acc = Integer(data_hash['totalAcc'])
      @total_il_high_credit_limit = Integer(data_hash['totalIlHighCreditLimit'])
      @num_rev_accts = Integer(data_hash['numRevAccts'])
      @mths_since_recent_bc_dlq = Integer(data_hash['mthsSinceRecentBcDlq'])
      @pub_rec_bankruptcies = Integer(data_hash['pubRecBankruptcies'])
      @num_accts_ever120_ppd = Integer(data_hash['numAcctsEver120Ppd'])
      @chargeoff_within12_mths = Integer(data_hash['chargeoffWithin12Mths'])
      @collections12_mths_ex_med = Integer(data_hash['collections12MthsExMed'])
      @tax_liens = Integer(data_hash['taxLiens'])
      @mths_since_last_major_derog = Integer(data_hash['mthsSinceLastMajorDerog'])
      @num_sats = Integer(data_hash['numSats'])
      @num_tl_op_past12m = Integer(data_hash['numTlOpPast12m'])
      @mo_sin_rcnt_tl = Integer(data_hash['moSinRcntTl'])
      @tot_hi_cred_lim = Integer(data_hash['totHiCredLim'])
      @tot_cur_bal = Integer(data_hash['totCurBal'])
      @avg_cur_bal = Integer(data_hash['avgCurBal'])
      @num_bc_tl = Integer(data_hash['numBcTl'])
      @num_actv_bc_tl = Integer(data_hash['numActvBcTl'])
      @num_bc_sats = Integer(data_hash['numBcSats'])
      @pct_tl_nvr_dlq = Integer(data_hash['pctTlNvrDlq'])
      @num_tl90g_dpd24m = Integer(data_hash['numTl90gDpd24m'])
      @num_tl30dpd = Integer(data_hash['numTl30dpd'])
      @num_tl120dpd2m = Integer(data_hash['numTl120dpd2m'])
      @num_il_tl = Integer(data_hash['numIlTl'])
      @mo_sin_old_il_acct = Integer(data_hash['moSinOldIlAcct'])
      @num_actv_rev_tl = Integer(data_hash['numActvRevTl'])
      @mo_sin_old_rev_tl_op = Integer(data_hash['moSinOldRevTlOp'])
      @mo_sin_rcnt_rev_tl_op = Integer(data_hash['moSinRcntRevTlOp'])
      @total_rev_hi_lim = Integer(data_hash['totalRevHiLim'])
      @num_rev_tl_bal_gt0 = Integer(data_hash['numRevTlBalGt0'])
      @num_op_rev_tl = Integer(data_hash['numOpRevTl'])
      @tot_coll_amt = Integer(data_hash['totCollAmt'])
      @funded_amount = Float(data_hash['fundedAmount'])
      @loan_amount = Float(data_hash['loanAmount'])
    end

    def self.collection(response)
      response['loans'].map do |loan|
        new(loan.merge('asOfDate' => response['asOfDate']))
      end
    end

  end
end
