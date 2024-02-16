# app/serializers/api/v1/user_serializer.rb

class Api::V1::ReviewSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :product_id, :content, :rating, :approved, :reviewed_at, :created_at, :updated_at

    belongs_to :user
    # belongs_to :product
end
  