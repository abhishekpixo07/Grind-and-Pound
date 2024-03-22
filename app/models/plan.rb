class Plan < ApplicationRecord
    has_many :subscriptions
    validates :name, presence: true, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to:  0 }
    validates :billing_interval, presence: true
  
    enum billing_interval: { daily: 'daily', weekly: 'weekly', monthly: 'monthly', quaterly: 'quaterly' , yearly: 'yearly' }

    def self.ransackable_attributes(auth_object = nil)
        %w[name price interval]
    end
    
    def self.ransackable_associations(auth_object = nil)
        %w[subscriptions]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["billing_interval", "created_at", "features", "id", "name", "price", "updated_at"]
    end

end
  