class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_one :payment, dependent: :destroy


  validates :user, presence: true
  validates :plan, presence: true

  after_save :update_expiry_date

  # Calculate subscription expiry date based on plan's billing interval
  def calculate_expiry_date
    case plan.billing_interval
    when 'daily'
      expires_at = created_at + 1.day
    when 'weekly'
      expires_at = created_at + 1.week
    when 'monthly'
      expires_at = created_at + 1.month
    when 'yearly'
      expires_at = created_at + 1.year
    else
      expires_at = nil
    end

    expires_at
  end

  # Update expiry date after saving the subscription
  def update_expiry_date
    unless expires_at_changed?
      self.expires_at = calculate_expiry_date
      update_column(:expires_at, expires_at)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "expires_at", "id", "plan_id", "status", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["plan", "user"]
  end
end
