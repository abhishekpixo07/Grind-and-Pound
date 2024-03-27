class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :subscription, optional: true
  belongs_to :order, optional: true

  validates :payment_status, inclusion: { in: %w(pending success failed) }
  validates :payment_amount, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "payment_amount", "payment_status", "updated_at", "user_id"]
  end

  # Other model code
end
