class Coupon < ApplicationRecord
  # Validations
  validates :code, presence: true, uniqueness: true
  validates :discount_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :max_discount_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :expiry_date, presence: true
  validates :no_of_uses, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
 
  # Associations
  has_many :user_coupons, dependent: :destroy
  has_many :users, through: :user_coupons
 
  # Scopes or methods
  scope :active, -> { where(active: true) }
  scope :applicable, ->(total_price) { where("minimum_purchase_amount <= ?", total_price) }
 
  def applicable?(total_price)
     self.minimum_purchase_amount <= total_price
  end
 
  def expired?
     self.expiry_date.present? && self.expiry_date < Date.current
  end

  def self.ransackable_associations(auth_object = nil)
    ["user_coupons", "users"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["active", "applicability", "code", "created_at", "description", "discount_percentage", "expiry_date", "id", "max_discount_amount", "minimum_purchase_amount", "no_of_uses", "stackable", "title", "unique_per_user", "updated_at", "usage_restrictions", "user_limit"]
  end
 end
 