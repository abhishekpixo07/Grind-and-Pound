class Coupon < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["active", "applicability", "code", "created_at", "description", "discount_percentage", "expiry_date", "id", "max_discount_amount", "minimum_purchase_amount", "no_of_uses", "stackable", "unique_per_user", "updated_at", "usage_restrictions", "user_limit"]
  end
end
