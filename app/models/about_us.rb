class AboutUs < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["content", "created_at", "id", "image_url", "published_at", "title", "updated_at"]
    end
    # validates :title, presence: true, uniqueness: true

end
