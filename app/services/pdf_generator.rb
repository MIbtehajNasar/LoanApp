class PdfGenerator
  def initialize(loan_request, calculation)
    @loan_request = loan_request
    @calculation = calculation
  end

  def generate
    pdf = WickedPdf.new.pdf_from_string(
      ApplicationController.render(
        template: 'loan_requests/termsheet',
        layout: 'pdf',
        locals: { loan_request: loan_request, calculation: calculation }
      )
    )
    save_pdf(pdf)
  end

  private

  def save_pdf(pdf)
    pdf_path = Rails.root.join("tmp/termsheet_#{loan_request.id}.pdf")
    File.open(pdf_path, 'wb') do |file|
      file << pdf
    end
    pdf_path
  end

  attr_reader :calculation, :loan_request
end