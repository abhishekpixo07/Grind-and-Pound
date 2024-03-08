# app/serializers/order_serializer.rb
class OrderSerializer < ActiveModel::Serializer
    attributes :id, :sub_total, :discount_amount, :shipping_fee, :total_amount, :status, :payment_method, :notes, :created_at, :updated_at
  
    belongs_to :user
    belongs_to :shipping_address
    has_one :payment
  end
  