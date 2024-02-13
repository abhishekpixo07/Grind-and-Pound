# app/serializers/api/v1/user_serializer.rb

class Api::V1::UserSerializer < ActiveModel::Serializer
    attributes :id, :country_code, :phone_number, :name, :email, :profile_pic, :active, :dob, :address, :state, :country, :gender, :attachment_url

    def attachment_url
        object.attachment.url if object.attachment.attached?
    end
end
  