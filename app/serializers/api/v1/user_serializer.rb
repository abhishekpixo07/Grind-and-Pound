# app/serializers/api/v1/user_serializer.rb

class Api::V1::UserSerializer < ActiveModel::Serializer
    attributes :id, :country_code, :phone_number, :title, :first_name, :last_name, :email, :profile_pic, :active, :dob, :doa, :address, :pin_code, :district, :state, :country, :gender, :attachment_url

    def attachment_url
        object.attachment.url if object.attachment.attached?
    end
end
  