# app/models/product_property.rb

class ProductProperty < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
  validates :value, presence: true
end
