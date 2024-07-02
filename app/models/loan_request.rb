class LoanRequest < ApplicationRecord
  # Validations
  validates :address, presence: true
  validates :loan_term, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 12 }
  validates :purchase_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :repair_budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :arv, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, format: { with: /\A\+?[0-9]{10,15}\z/ } # Adjust the regex as per your phone number format requirements

  # Custom Validations
  validate :valid_purchase_price_and_arv

  private

  # Custom validation method
  def valid_purchase_price_and_arv
    if purchase_price.present? && arv.present? && purchase_price > arv
      errors.add(:purchase_price, 'must be less than or equal to ARV (After Repair Value)')
    end
  end
end
