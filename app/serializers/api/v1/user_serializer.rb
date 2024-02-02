# app/serializers/api/v1/user_serializer.rb

class Api::V1::UserSerializer < ActiveModel::Serializer
    attributes :id, :country_code, :phone_number, :name, :email, :profile_pic, :active
end
  