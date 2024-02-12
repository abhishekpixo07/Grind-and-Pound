# app/serializers/product_serializer.rb

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :available_on, :net_wt, :discontinue_on, :master_price, :cost_price, :subcategory_id, :attachment_url

  def attachment_url
    object.attachment.url if object.attachment.attached?
  end
end
