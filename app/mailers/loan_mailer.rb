class LoanMailer < ApplicationMailer
  def termsheet_email(loan_request, pdf_path)
    @loan_request = loan_request
    attachments['termsheet.pdf'] = File.read(pdf_path)

    mail(to: @loan_request.email, subject: 'Your Termsheet')
  end
end
