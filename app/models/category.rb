class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :subcategories
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "image", "name", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["subcategories"]
      end
end
