# app/serializers/order_serializer.rb
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :sub_total, :discount_amount, :shipping_fee, :total_amount, :status, :payment_method, :notes, :created_at, :delivery_date, :updated_at, :order_items, :user

  belongs_to :shipping_address
  has_one :payment
  has_many :order_items

  def delivery_date
    object.delivery_date.present? ? object.delivery_date : object.created_at + 2.days 
  end

  def user
    object.user
  end

  def order_items
    object.order_items.map do |order_item|
      {
        id: order_item.id,
        quantity: order_item.quantity,
        unit_price: order_item.unit_price,
        total_price: order_item.total_price,
        product: ProductSerializer.new(order_item.product),
      }
    end
  end
end
