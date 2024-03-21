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
  
      panel "Shipping Addresses (Total: #{user.shipping_addresses.count})" do
        table_for(user.shipping_addresses) do
          column :id
          column :first_name
          column :last_name
          column :address_line_1
          column :address_line_2
          column :city
          column :state
          column :postal_code
          column :country
          column :phone_number
          column :created_at
        end
      end
  
      panel "Orders (Total: #{user.orders.count})" do
        table_for(user.orders) do
          column :id
          column :razorpay_order_id
          column :total_amount
          column :status
          column :payment_method
          column :paid_at
          column :shipped_at
          column :notes
          column :gift_wrap
          column :tracking_number
          column :created_at
          column "Payment" do |order|
            if order.payment
              panel "Payment Details" do
                attributes_table_for order.payment do
                  row :razorpay_payment_id
                  row :payment_status
                  row :payment_amount
                  row :created_at
                end
              end
            else
              "No payment details available"
            end
          end
        end
      end    
  
      panel "Subscriptions (Total: #{user.subscriptions.count})" do
        table_for(user.subscriptions) do
          column :id
          column :status
          column :expires_at
          column :created_at
          column "Plan" do |subscription|
            if subscription.plan
              panel "Plan Details" do
                attributes_table_for subscription.plan do
                  row :name
                  row :price
                  row :billing_interval
                  row :features
                end
              end
            else
              "No plan details available"
            end
          end
        end
      end
    end
  
 end
 