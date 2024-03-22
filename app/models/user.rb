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

    has_many :temp_user_coupons, dependent: :destroy
    has_many :user_coupons, dependent: :destroy
    has_many :coupons, through: :user_coupons

    has_one :subscription, dependent: :destroy
    has_many :plans, through: :subscriptions

    has_many :referrals, foreign_key: 'referrer_id', dependent: :destroy
    has_many :referred_users, through: :referrals, source: :referred_user,dependent: :destroy

    # Method to associate a referrer with a referred user
    def refer(referral_key)
      referrer = User.find_by(referral_key: referral_key)
      if referrer.present?
        self.referrals.create(referrer: referrer)
      end
    end


    before_validation :capitalize_names

    def active_subscriptions
      subscriptions.active
    end

    def self.ransackable_attributes(auth_object = nil)
        %w[active country_code created_at email id name otp phone_number profile_pic updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
      ["attachment_attachment", "attachment_blob", "cart", "coupons", "invoices", "orders", "payments", "plans", "referrals", "referred_users", "reviews", "sessions", "shipping_addresses", "subscriptions", "temp_user_coupons", "user_coupons"]
    end
  

    private

    def capitalize_names
      self.title = title.capitalize if title.present?
      self.first_name = first_name.capitalize if first_name.present?
      self.last_name = last_name.capitalize if last_name.present?
    end
end
