class Blog < ApplicationRecord
    mount_uploader :image, BlogImageUploader
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "image", "title", "updated_at"]
    end
end
