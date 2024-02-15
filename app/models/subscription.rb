class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  validates :user, presence: true
  validates :plan, presence: true

  before_save :calculate_next_billing_date
  attr_accessor :next_billing_date

  def calculate_next_billing_date
    self.next_billing_date = plan.interval ? plan.interval.from_now : nil
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "expires_at", "id", "plan_id", "status", "updated_at", "user_id"]
  end
end
