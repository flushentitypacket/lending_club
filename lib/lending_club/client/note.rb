require 'bigdecimal'

module LendingClub
  class Note

    def self.collection(data_hash)
      return [] unless data_hash['loans']
      data_hash['loans'].map do |loan|
        new(loan.tap {|h| h['asOfDate'] = data_hash['asOfDate']})
      end
    end

    def initialize(data_hash)
      @raw = data_hash
    end

    attr_reader :raw

    # As of date
    def as_of_date
      raw['asOfDate']
    end

    # A unique LC assigned ID for the loan listing.
    def id
      raw['id']
    end

    # A unique LC assigned Id for the borrower member.
    def member_id
      raw['memberId']
    end

    # The Number of payments on the loan. Values are in months and can be either 36 or 60.
    def term
      raw['term']
    end

    # Interest Rate on the loan
    def int_rate
      BigDecimal.new(raw['intRate'])
    end

    # The expected default rate of the loan.
    def exp_default_rate
      BigDecimal.new(raw['expDefaultRate'])
    end

    # Service fee rate paid by the investor for this loan.
    def service_fee_rate
      BigDecimal.new(raw['serviceFeeRate'])
    end

    # The monthly payment owed by the borrower if the loan originates.
    def installment
      BigDecimal.new(raw['installment'])
    end

    # LC assigned loan grade
    def grade
      raw['grade']
    end

    # LC assigned loan subgrade
    def sub_grade
      raw['subGrade']
    end

    # Employment length in years. Possible values are between 0 and 10 where 0 means less than one year and 10 means ten or more years.
    def emp_length
      raw['empLength']
    end

    # The home ownership status provided by the borrower during registration. Our values are: RENT, OWN, MORTGAGE, OTHER
    def home_ownership
      raw['homeOwnership']
    end

    # The annual income provided by the borrower during registration.
    def annual_inc
      BigDecimal.new(raw['annualInc'])
    end

    # Indicates if income is verified by LC
    def is_inc_v
      raw['isIncV']
    end

    # The date which the borrower accepted the offer
    def accept_d
      raw['acceptD']
    end

    # The date the listing will expire
    def exp_d
      raw['expD']
    end

    # The date which the borrower's application was listed on the platform.
    def list_d
      raw['listD']
    end

    # The date LC pulled credit for this loan
    def credit_pull_d
      raw['creditPullD']
    end

    # The date the loan application was reviewed by LC
    def review_status_d
      raw['reviewStatusD']
    end

    # The status of the loan during the listing period. Values: APPROVED, NOT_APPROVED.
    def review_status
      raw['reviewStatus']
    end

    # Loan description provided by the borrower
    def desc
      raw['desc']
    end

    # A category provided by the borrower for the loan request. Values are: DEBT_CONSOLIDATION, MEDICAL, HOME_IMPROVEMENT, RENEWABLE_ENERGY, SMALL_BUSINESS, WEDDING, VACATION, MOVING, HOUSE, CAR, MAJOR_PURCHASE, OTHER
    def purpose
      raw['purpose']
    end

    # The first 3 numbers of the ZIP code provided by the borrower in the loan application.
    def addr_zip
      raw['addrZip']
    end

    # The address state provided by the borrower during loan application
    def addr_state
      raw['addrState']
    end

    # The Number of investor members who have purchased notes from this loan
    def investor_count
      raw['investorCount']
    end

    # The date and time when the loan will no longer be in the initial listing status. After this date is past, the initialListStatus below will not have any effect and the loan will be treated as a FRACTIONAL loan.
    def ils_exp_d
      raw['ilsExpD']
    end

    # The initial listing status of the loan.  Possible values are W, F. For more information please read Loan Listing and Whole Loans section.
    def initial_list_status
      raw['initialListStatus']
    end

    # Employment title
    def emp_title
      raw['empTitle']
    end

    # The Number of accounts on which the borrower is now delinquent.
    def acc_now_delinq
      raw['accNowDelinq']
    end

    # Number of trades opened in past 24 months.
    def acc_open_past24_mths
      raw['accOpenPast24Mths']
    end

    # Total open to buy on revolving bankcards.
    def bc_open_to_buy
      raw['bcOpenToBuy']
    end

    # Percentage of all bankcard accounts > 75% of limit.
    def percent_bc_gt75
      BigDecimal.new(raw['percentBcGt75'])
    end

    # Ratio of total current balance to high credit/credit limit for all bankcard accounts.
    def bc_util
      BigDecimal.new(raw['bcUtil'])
    end

    # The borrower's debt to income ratio, calculated using the monthly payments on the total debt obligations, excluding mortgage, divided by self-reported monthly income.
    def dti
      BigDecimal.new(raw['dti'])
    end

    # The Number of 30+ days past-due incidences of delinquency in the borrower's credit file for the past 2 years.
    def delinq2_yrs
      raw['delinq2Yrs']
    end

    # The past-due amount owed for the accounts on which the borrower is now delinquent.
    def delinq_amnt
      BigDecimal.new(raw['delinqAmnt'])
    end

    # The date the borrower's earliest reported credit line was opened
    def earliest_cr_line
      raw['earliestCrLine']
    end

    # The lower boundary of range the borrower's FICO belongs to.
    def fico_range_low
      raw['ficoRangeLow']
    end

    # The upper boundary of range the borrower's FICO belongs to.
    def fico_range_high
      raw['ficoRangeHigh']
    end

    # The Number of inquiries by creditors during the past 6 months.
    def inq_last6_mths
      raw['inqLast6Mths']
    end

    # The Number of months since the borrower's last delinquency.
    def mths_since_last_delinq
      raw['mthsSinceLastDelinq']
    end

    # The Number of months since the last public record.
    def mths_since_last_record
      raw['mthsSinceLastRecord']
    end

    # Months since most recent inquiry.
    def mths_since_recent_inq
      raw['mthsSinceRecentInq']
    end

    # Months since most recent revolving delinquency.
    def mths_since_recent_revol_delinq
      raw['mthsSinceRecentRevolDelinq']
    end

    # Months since most recent bankcard account opened.
    def mths_since_recent_bc
      raw['mthsSinceRecentBc']
    end

    # Number of mortgage accounts.
    def mort_acc
      raw['mortAcc']
    end

    # The Number of open credit lines in the borrower's credit file.
    def open_acc
      raw['openAcc']
    end

    # Number of derogatory public records.
    def pub_rec
      raw['pubRec']
    end

    # Total credit balance excluding mortgage.
    def total_bal_ex_mort
      raw['totalBalExMort']
    end

    # Total credit revolving balance.
    def revol_bal
      BigDecimal.new(raw['revolBal'])
    end

    # Revolving line utilization rate, or the amount of credit the borrower is using relative to all available revolving credit.
    def revol_util
      BigDecimal.new(raw['revolUtil'])
    end

    # Total bankcard high credit/credit limit.
    def total_bc_limit
      raw['totalBcLimit']
    end

    # The total Number of credit lines currently in the borrower's credit file
    def total_acc
      raw['totalAcc']
    end

    # Total installment high credit/credit limit
    def total_il_high_credit_limit
      raw['totalIlHighCreditLimit']
    end

    # Number of revolving accounts
    def num_rev_accts
      raw['numRevAccts']
    end

    # Months since most recent bankcard delinquency.
    def mths_since_recent_bc_dlq
      raw['mthsSinceRecentBcDlq']
    end

    # Number of public record bankruptcies.
    def pub_rec_bankruptcies
      raw['pubRecBankruptcies']
    end

    # Number of accounts ever 120 or more days past due.
    def num_accts_ever120_ppd
      raw['numAcctsEver120Ppd']
    end

    # Number of charge-offs within 12 months.
    def chargeoff_within12_mths
      raw['chargeoffWithin12Mths']
    end

    # Number of collections in 12 months excluding medical collections.
    def collections12_mths_ex_med
      raw['collections12MthsExMed']
    end

    # Number of tax liens
    def tax_liens
      raw['taxLiens']
    end

    # Months since most recent 90-day or worse rating.
    def mths_since_last_major_derog
      raw['mthsSinceLastMajorDerog']
    end

    # Number of satisfactory accounts
    def num_sats
      raw['numSats']
    end

    # Number of accounts opened in past 12 months
    def num_tl_op_past12m
      raw['numTlOpPast12m']
    end

    # Months since most recent account opened
    def mo_sin_rcnt_tl
      raw['moSinRcntTl']
    end

    # Total high credit/credit limit
    def tot_hi_cred_lim
      raw['totHiCredLim']
    end

    # Total current balance of all accounts
    def tot_cur_bal
      raw['totCurBal']
    end

    # Average current balance of all accounts
    def avg_cur_bal
      raw['avgCurBal']
    end

    # Number of bankcard accounts
    def num_bc_tl
      raw['numBcTl']
    end

    # Number of currently active bankcard accounts
    def num_actv_bc_tl
      raw['numActvBcTl']
    end

    # Number of satisfactory bankcard accounts
    def num_bc_sats
      raw['numBcSats']
    end

    # Percent of trades never delinquent
    def pct_tl_nvr_dlq
      raw['pctTlNvrDlq']
    end

    # Number of accounts 90 or more days past due in last 24 months
    def num_tl90g_dpd24m
      raw['numTl90gDpd24m']
    end

    # Number of accounts currently 30 days past due (updated in past 2 months)
    def num_tl30dpd
      raw['numTl30dpd']
    end

    # Number of accounts currently 120 days past due (updated in past 2 months)
    def num_tl120dpd2m
      raw['numTl120dpd2m']
    end

    # Number of installment accounts
    def num_il_tl
      raw['numIlTl']
    end

    # Months since oldest installment account opened
    def mo_sin_old_il_acct
      raw['moSinOldIlAcct']
    end

    # Number of currently active revolving trades
    def num_actv_rev_tl
      raw['numActvRevTl']
    end

    # Months since oldest revolving account opened
    def mo_sin_old_rev_tl_op
      raw['moSinOldRevTlOp']
    end

    # Months since most recent revolving account opened
    def mo_sin_rcnt_rev_tl_op
      raw['moSinRcntRevTlOp']
    end

    # Total revolving high credit/credit limit
    def total_rev_hi_lim
      raw['totalRevHiLim']
    end

    # Number of revolving trades with balance > 0
    def num_rev_tl_bal_gt0
      raw['numRevTlBalGt0']
    end

    # Number of open revolving accounts
    def num_op_rev_tl
      raw['numOpRevTl']
    end

    # Total collection amounts ever owed
    def tot_coll_amt
      raw['totCollAmt']
    end

    # The total amount funded by investors for that loan at that point in time.
    def funded_amount
      BigDecimal.new(raw['fundedAmount'])
    end

    # The listed amount of the loan applied for by the borrower. If at some point in time, the credit department reduces the loan amount, then it will be reflected in this value.
    def loan_amount
      BigDecimal.new(raw['loanAmount'])
    end

  end
end
