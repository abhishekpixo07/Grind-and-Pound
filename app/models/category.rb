class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :subcategories

    after_create :create_corresponding_faq_category

    def create_corresponding_faq_category
        FaqCategory.create(title: self.name) unless FaqCategory.exists?(title: self.name)
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "image", "name", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["subcategories"]
      end
end
