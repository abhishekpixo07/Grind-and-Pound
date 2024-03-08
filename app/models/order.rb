class Order < ApplicationRecord
    belongs_to :user
    belongs_to :shipping_address
    has_one :payment
    
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "gift_wrap", "id", "notes", "paid_at", "payment_method", "shipped_at", "shipping_address_id", "status", "total_amount", "tracking_number", "updated_at", "user_id","sub_total", "discount_amount", "shipping_fee","grand_total","delivery_method"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["payment", "shipping_address", "user"]
    end
end
