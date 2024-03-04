class User < ApplicationRecord
    validates :phone_number, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true

    has_many :sessions

    has_one :cart
    has_many :orders
    has_many :shipping_addresses
    has_many :payments
    has_many :reviews
    
    has_one_attached :attachment

    has_many :subscriptions, dependent: :destroy
    has_many :plans, through: :subscriptions

    has_many :referrals, foreign_key: 'referrer_id', dependent: :destroy
    has_many :referred_users, through: :referrals, source: :referred_user
  
    def active_subscriptions
      subscriptions.active
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[active country_code created_at email id name otp phone_number profile_pic updated_at]
    end
end
