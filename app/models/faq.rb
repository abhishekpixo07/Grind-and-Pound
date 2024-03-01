class Faq < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["answer", "created_at", "id", "question", "updated_at"]
    end
end
