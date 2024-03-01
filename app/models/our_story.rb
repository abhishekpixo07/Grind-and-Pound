class OurStory < ApplicationRecord
    mount_uploader :image, OurStoryImageUploader

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "id", "image", "title", "updated_at"]
    end
end
