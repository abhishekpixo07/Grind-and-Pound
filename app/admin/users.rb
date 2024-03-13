ActiveAdmin.register User do
  permit_params :name, :email, :phone_number, :country_code, :profile_pic, :otp, :active
 
  filter :name
  filter :email
  filter :phone_number
  filter :active

  # In your Admin::UsersController
  member_action :toggle_active, method: :put do
    @user = User.find(params[:id])
    @user.update(active: !@user.active)
    redirect_to admin_users_path, notice: "User status updated successfully."
  end

  index do
     selectable_column
     id_column
     column :full_name do |user|
       "#{user.title} #{user.first_name} #{user.last_name}".strip
     end
     column :email
     column :phone_number do |user|
       (user.country_code.present? && user.phone_number.present?) ? user.country_code + user.phone_number : ""
     end
     column :active
     column :attachment do |user|
       image_tag url_for(user.attachment.present? ? user.attachment : ''), width:100, height:80, skip_pipeline: true
     end
    actions defaults: false do |user|
      item raw('View&nbsp;&nbsp;'), admin_user_path(user), class: 'view_link'
      if user.active
        item 'Inactive', toggle_active_admin_user_path(user), method: :put, class: 'view_link make_inactive', data: { confirm: 'Are you sure?' }
      else
        item 'Active', toggle_active_admin_user_path(user), method: :put, class: 'view_link make_active', data: { confirm: 'Are you sure?' }
      end
    end   
  end
 
  show do
     attributes_table do
       row :id
       row :full_name do |user|
         "#{user.title} #{user.first_name} #{user.last_name}".strip
       end
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
 