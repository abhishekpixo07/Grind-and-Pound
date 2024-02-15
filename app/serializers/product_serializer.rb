# app/serializers/product_serializer.rb

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :available_on, :net_wt, :unit, :discontinue_on, :master_price, :cost_price, :subcategory_id, :attachment_url, :cart, :product_properties, :variants, :reviews

  def attachment_url
    object.product_images.map do |pi|
      pi.attachment.url if pi.attachment.attached?
    end.compact
  end

  def cart
    false
  end

  def product_properties
    object.product_properties.map do |pp|
      {
        id: pp.id,
        name: pp.name,
        value: pp.value
      }
    end
  end

  def variants
    object.variants.map do |variant|
      {
        id: variant.id,
        sku: variant.sku,
        price: variant.price,
        net_wt: variant.net_wt,
        unit: variant.unit
      }
    end
  end

  def reviews
    object.reviews.map do |review|
      p ":----------"
      p review
      {
        id: review.id,
        content: review.content,
        rating: review.rating,
        reviewed_at: review.reviewed_at,
        created_at: review.created_at,
        user: {
          id: review.user.id,
          name: review.user.name,
          email: review.user.email,
          phone_number: review.user.phone_number,
          # Add other user attributes as needed
        }
      }
    end
  end  

end
