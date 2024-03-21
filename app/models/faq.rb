class Faq < ApplicationRecord
    belongs_to :faq_category
  
    def self.ransackable_attributes(auth_object = nil)
        ["answer", "created_at", "id", "question", "updated_at"]
    end
    
    def self.ransackable_associations(auth_object = nil)
        ["faq_category"]
    end
end
