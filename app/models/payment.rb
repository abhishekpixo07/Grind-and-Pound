class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :payment_status, inclusion: { in: %w(pending success failed) }
  validates :payment_amount, numericality: { greater_than_or_equal_to: 0 }

  # Other model code
end
