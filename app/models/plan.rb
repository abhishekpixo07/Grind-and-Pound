class Plan < ApplicationRecord
    has_many :subscriptions
    validates :name, presence: true, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to:  0 }
    validates :interval, presence: true
  
    enum interval: { daily:  0, weekly:  1, monthly:  2, yearly:  3 }

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
  