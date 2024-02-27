# app/admin/user.rb

ActiveAdmin.register User do
  permit_params :name, :email, :phone_number, :country_code, :profile_pic, :otp, :active

  filter :name
  filter :email
  filter :phone_number
  filter :active

  index do
    selectable_column
    id_column
    column :first_name
    column :email
    column :phone_number do |user|
      (user.country_code.present? && user.phone_number.present?) ? user.country_code + user.phone_number : ""
    end
    column :dob
    column :address
    column :state
    column :country
    column :gender
    column :active
    column :attachment do |user|
      image_tag url_for(user.attachment.present? ? user.attachment : ''), width:100, height:80, skip_pipeline: true
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :first_name
      row :email
      row :phone_number do |user|
        (user.country_code.present? && user.phone_number.present?) ? user.country_code + user.phone_number : ""
      end
      row :dob
      row :address
      row :state
      row :country
      row :gender
      row :attachment do |user|
        image_tag url_for(user.attachment.present? ? user.attachment : ''), width:100, height:80, skip_pipeline: true
      end
      row :otp
      row :active
      row :created_at
      row :updated_at
    end
  end
end
