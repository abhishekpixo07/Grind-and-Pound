# app/serializers/api/v1/user_subscription_serializer.rb
class Api::V1::SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :plan_id, :status, :created_at, :updated_at

  belongs_to :plan

   # Set the root key for the JSON response
  def to_json(*args)
    { subscriptions: super }.to_json(*args)
  end
end
