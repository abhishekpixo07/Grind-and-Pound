class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "product_id", "quantity", "total_price", "unit_price", "updated_at"]
  end

end
