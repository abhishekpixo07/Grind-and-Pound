class Variant < ApplicationRecord
  belongs_to :product
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "price", "product_id", "sku", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["product"]
  end
end
