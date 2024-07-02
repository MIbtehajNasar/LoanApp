class LoanCalculator
  ANNUAL_INTEREST_RATE = 0.13

  def initialize(loan_request)
    @loan_request = loan_request
  end

  def calculate
    loan_amount = calculate_loan_amount
    interest_expense = calculate_interest_expense(loan_amount)
    profit = loan_request.arv - loan_amount - interest_expense

    {
      loan_amount: loan_amount,
      interest_expense: interest_expense,
      profit: profit
    }
  end

  private

  attr_reader :loan_request

  def calculate_loan_amount
    max_loan_by_purchase_price = loan_request.purchase_price * 0.9
    max_loan_by_arv = loan_request.arv * 0.7
    [max_loan_by_purchase_price + loan_request.repair_budget, max_loan_by_arv].min
  end

  def calculate_interest_expense(loan_amount)
    monthly_rate = ANNUAL_INTEREST_RATE / 12.0
    months = loan_request.loan_term
    loan_amount * monthly_rate * months
  end
end