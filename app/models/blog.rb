class Blog < ApplicationRecord
    mount_uploader :image, BlogImageUploader
    belongs_to :blog_category
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "image", "title", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["blog_category"]
    end
end
