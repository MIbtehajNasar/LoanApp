class CalculateLoanJob < ApplicationJob
  queue_as :default

  def perform(loan_request_id)
    loan_request = LoanRequest.find(loan_request_id)
    calculation = LoanCalculator.new(loan_request).calculate
    pdf_path = PdfGenerator.new(loan_request, calculation).generate
    LoanMailer.termsheet_email(loan_request, pdf_path).deliver_now
  end
end
