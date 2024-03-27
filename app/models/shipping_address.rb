class ShippingAddress < ApplicationRecord
    belongs_to :user
    before_save :ensure_single_default_address

    def ensure_single_default_address
        if self.default_changed? && self.default == true
          user.shipping_addresses.where.not(id: self.id).update_all(default: false)
        elsif user.shipping_addresses.where(default: true).count == 0
          self.default = true
        elsif self.default.nil?
            self.default = false
        end
    end

    def self.ransackable_attributes(auth_object = nil)
        ["address_line_1", "address_line_2", "city", "country", "created_at", "full_name", "id", "postal_code", "state", "updated_at", "user_id"]
    end
end
