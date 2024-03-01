class Voucher < ApplicationRecord
    validates :title, presence: true
    validates :expiry_date, presence: true
    validates :code, presence: true, uniqueness: true  

    def self.ransackable_attributes(auth_object = nil)
        ["code", "created_at", "description", "expiry_date", "id", "title", "updated_at"]
    end
end
