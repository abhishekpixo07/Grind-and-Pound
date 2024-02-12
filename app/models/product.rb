# app/models/product.rb
class Product < ApplicationRecord
  belongs_to :subcategory
  has_one_attached :attachment

  # has_many :images, class_name: 'Image', foreign_key: 'product_id'
  # accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  has_many :variants

  def self.ransackable_associations(auth_object = nil)
    ["images", "subcategory", "variants"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["available_on", "cost_price", "created_at", "description", "discontinue_on", "id", "master_price", "name", "subcategory_id", "updated_at"]
  end
end
