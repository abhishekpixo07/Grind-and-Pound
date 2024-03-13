class Order < ApplicationRecord
    belongs_to :user
    belongs_to :shipping_address
    has_one :payment, dependent: :destroy
    has_many :order_items, dependent: :destroy

    accepts_nested_attributes_for :order_items
    
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "gift_wrap", "id", "notes", "paid_at", "payment_method", "shipped_at", "shipping_address_id", "status", "total_amount", "tracking_number", "updated_at", "user_id","sub_total", "discount_amount", "shipping_fee","grand_total","delivery_method","razorpay_order_id"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["payment", "shipping_address", "user","order_items"]
    end

    before_update :order_status_changed, if: :status_changed?

    private
  
    def order_status_changed
      OrderMailer.order_status(self.user, self).deliver_now
    end
end
