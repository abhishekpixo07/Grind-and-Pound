class Banner < ApplicationRecord
    has_one_attached :attachment
    def self.ransackable_attributes(auth_object = nil)
        ["banner_type", "created_at", "id", "text_color", "title", "updated_at"]
    end
end
