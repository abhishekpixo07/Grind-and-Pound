class Subcategory < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "image", "name", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
