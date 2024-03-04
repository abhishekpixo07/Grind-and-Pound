class BlogCategory < ApplicationRecord
    has_many :blogs
    validates :title, presence: true, uniqueness: true
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "title", "updated_at"]
    end
end