


class OrderSerializer < ActiveModel::Serializer
  attributes :id, :sub_total, :discount_amount, :shipping_fee, :total_amount, :status, :payment_method, :notes, :created_at, :delivery_date, :updated_at, :order_items, :shipping_address

  has_one :payment
  has_one :user
  has_many :order_items

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

  def delivery_date
    object.delivery_date.present? ? object.delivery_date : object.created_at + 2.days 
  end

  def shipping_address
    {
      address_line_1: object.address_line_1,
      address_line_2: object.address_line_2,
      city: object.city,
      state: object.state,
      postal_code: object.postal_code,
      country: object.country
    }
  end
end
