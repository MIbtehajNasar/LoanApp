class LoanRequestsController < ApplicationController
  def new
    @loan_request = LoanRequest.new
  end

  def create
    @loan_request = LoanRequest.new(loan_request_params)
    if @loan_request.save
      CalculateLoanJob.perform_later(@loan_request.id)
      redirect_to @loan_request, notice: "Loan request was successfully created."
    else
      render :new
    end
  end

  def show
    @loan_request = LoanRequest.find(params[:id])
  end

  private

  def loan_request_params
    params.require(:loan_request).permit(:address, :loan_term, :purchase_price, :repair_budget, :arv, :name, :email, :phone)
  end
end
