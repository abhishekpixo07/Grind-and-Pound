class AdminUser < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email", "id", "password_digest", "updated_at"]
    end    
end
