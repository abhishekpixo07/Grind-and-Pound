# app/serializers/product_serializer.rb

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :available_on, :discontinue_on, :master_price, :cost_price, :subcategory_id
end
