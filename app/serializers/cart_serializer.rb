# app/serializers/cart_serializer.rb
class CartSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :purchased, :created_at, :updated_at
    has_many :cart_items
  
    def cart_items
      object.cart_items.map do |cart_item|
        {
          id: cart_item.id,
          quantity: cart_item.quantity,
          product: ProductSerializer.new(cart_item.product)
        }
      end
    end
end
  