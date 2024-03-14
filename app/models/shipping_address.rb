class ShippingAddress < ApplicationRecord
    belongs_to :user
    def self.ransackable_attributes(auth_object = nil)
        ["address_line_1", "address_line_2", "city", "country", "created_at", "full_name", "id", "postal_code", "state", "updated_at", "user_id"]
    end
end
