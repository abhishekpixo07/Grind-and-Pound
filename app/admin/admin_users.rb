# app/admin/admin_user.rb
ActiveAdmin.register AdminUser do
    #filters              
    filter :email    
    collection_action :custom_logout, method: :delete do
      sign_out current_admin_user
      redirect_to '/some_path'
    end
end
  