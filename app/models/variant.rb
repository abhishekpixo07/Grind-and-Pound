class Variant < ApplicationRecord
  belongs_to :product
  validates :sku, uniqueness: true, presence: true
  validates :net_wt, presence: true
  validates :unit, presence: true

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  attribute :quantity, :integer, default: 0
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "price", "product_id", "sku", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["product"]
  end
end
