class User < ApplicationRecord
    has_many :sessions
    validates :phone_number, uniqueness: true, presence: true

    has_many :orders
    has_many :shipping_addresses
    has_many :payments

    has_one_attached :attachment

    def self.ransackable_attributes(auth_object = nil)
        %w[active country_code created_at email id name otp phone_number profile_pic updated_at]
    end
end
