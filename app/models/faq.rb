class Faq < ApplicationRecord
    belongs_to :faq_category
  
    def self.ransackable_attributes(auth_object = nil)
        ["answer", "created_at", "id", "question", "updated_at"]
    end
end
