# app/serializers/product_serializer.rb

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :available_on, :net_wt, :unit, :discontinue_on, :master_price, :cost_price, :subcategory_id, :attachment_url, :cart, :is_texture, :textures, :product_properties, :variants, :reviews, :overall_average_rating

  def attachment_url
    object.product_images.map do |pi|
      pi.attachment.url if pi.attachment.attached?
    end.compact
  end

  def cart
    false
  end

  def textures
    if is_texture == true
      object.textures.map do |tex|
        {
          id: tex.id,
          name: tex.name,
        }
      end
    else
      []
    end
  end

  def is_texture
    (object.subcategory.category.name == "Wheat flour") ? true : false
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
        discount_price: variant.discount_price,
        net_wt: variant.net_wt,
        unit: variant.unit
      }
    end
  end

  def reviews
    object.reviews.map do |review|
      {
        id: review.id,
        content: review.content,
        rating: review.rating,
        reviewed_at: review.reviewed_at,
        created_at: review.created_at,
        user: {
          id: review.user.id,
          name: "#{review.user.title.to_s} #{review.user.first_name.to_s} #{review.user.last_name.to_s}".strip ,
          email: review.user.email,
          phone_number: review.user.phone_number,
          profile_pic: review.user.attachment.url
          # Add other user attributes as needed
        }
      }
    end
  end  

  def overall_average_rating
    object.reviews.average(:rating).to_f.round(0)
  end

end
