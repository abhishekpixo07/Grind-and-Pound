# app/models/product.rb
class Product < ApplicationRecord
  belongs_to :subcategory
  has_many :images
  has_many :variants

  def self.ransackable_associations(auth_object = nil)
    ["images", "subcategory", "variants"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["available_on", "cost_price", "created_at", "description", "discontinue_on", "id", "master_price", "name", "subcategory_id", "updated_at"]
  end
  
end
