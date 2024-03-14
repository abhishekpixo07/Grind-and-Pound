class Store < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["address_line_1", "address_line_2", "city", "contact", "country", "created_at", "id", "name", "postal_code", "state", "updated_at","phone_number"]
    end
    
    def self.ransackable_associations(auth_object = nil)
        []
    end

    validates :name, presence: true
    validates :address_line_1, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :postal_code, presence: true

end
