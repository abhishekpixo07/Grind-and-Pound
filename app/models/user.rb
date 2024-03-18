class User < ApplicationRecord
    validates :phone_number, uniqueness: true, presence: true

    has_many :sessions, dependent: :destroy

    has_one :cart, dependent: :destroy
    has_many :user_coupons, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :invoices, through: :orders
    has_many :shipping_addresses, dependent: :destroy
    has_many :payments, dependent: :destroy
    has_many :reviews, dependent: :destroy
    
    has_one_attached :attachment

    has_many :user_coupons, dependent: :destroy
    has_many :coupons, through: :user_coupons

    has_many :subscriptions, dependent: :destroy
    has_many :plans, through: :subscriptions

    has_many :referrals, foreign_key: 'referrer_id', dependent: :destroy
    has_many :referred_users, through: :referrals, source: :referred_user
  
    before_validation :capitalize_names

    def active_subscriptions
      subscriptions.active
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[active country_code created_at email id name otp phone_number profile_pic updated_at]
    end

    private

    def capitalize_names
      self.title = title.capitalize if title.present?
      self.first_name = first_name.capitalize if first_name.present?
      self.last_name = last_name.capitalize if last_name.present?
    end
end
