require 'test_helper'
require 'json'

class LoanTest < Minitest::Test

  def test_parses_successful_response
    response = JSON.parse(fixture('loan_response.json').read)
    LendingClub::Loan.collection(response)
  end

end
