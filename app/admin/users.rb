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
    column :name
    column :email
    column :phone_number
    column :country_code
    column :active
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :phone_number
      row :country_code
      row :profile_pic
      row :otp
      row :active
      row :created_at
      row :updated_at
    end
  end
end
