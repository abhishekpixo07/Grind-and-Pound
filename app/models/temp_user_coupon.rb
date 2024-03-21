class TempUserCoupon < ApplicationRecord
  belongs_to :user
  belongs_to :coupon
  def self.ransackable_attributes(auth_object = nil)
    ["coupon_id", "created_at", "id", "updated_at", "user_id"]
  end
end
