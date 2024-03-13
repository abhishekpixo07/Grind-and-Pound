# app/models/product.rb
class Product < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :net_wt, presence: true
  validates :master_price, presence: true
  validates :cost_price, presence: true
  validates :unit, presence: true
  has_many :order_items, dependent: :destroy

  # validates :available_zip_codes, presence: { message: "must be present" }

  belongs_to :subcategory

  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

  has_many :variants
  accepts_nested_attributes_for :variants, allow_destroy: true

  has_many :textures
  accepts_nested_attributes_for :textures, allow_destroy: true

  has_many :product_properties
  accepts_nested_attributes_for :product_properties, allow_destroy: true

  # Nested attributes
  accepts_nested_attributes_for :product_images, allow_destroy: true
  accepts_nested_attributes_for :variants, allow_destroy: true
  accepts_nested_attributes_for :textures, allow_destroy: true
  accepts_nested_attributes_for :product_properties, allow_destroy: true

  has_many :reviews
  
  def available_for_zip_code?(zip_code)
    available_zip_codes.include?(zip_code)
  end

  scope :filter_by_price_range, ->(min_price, max_price) do
    where(master_price: min_price..max_price)
  end

  scope :filter_by_subcategory, ->(subcategory_id) do
    where(subcategory_id: subcategory_id)
  end

  scope :filter_by_net_wt_and_unit, ->(net_wt_unit) do
    net_wt, unit = net_wt_unit.match(/(\d+)([a-zA-Z]+)/).captures
    where(net_wt: net_wt, unit: unit)
  end

  def self.ransackable_associations(auth_object = nil)
    ["images", "subcategory", "variants"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["available_on", "cost_price", "created_at", "description", "discontinue_on", "id", "master_price", "name", "subcategory_id", "updated_at"]
  end
end
