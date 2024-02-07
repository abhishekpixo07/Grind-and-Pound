# app/admin/coupon.rb

ActiveAdmin.register Coupon do
    permit_params :code, :discount_percentage, :max_discount_amount, :active, 
                  :expiry_date, :no_of_uses, :description, :applicability,
                  :minimum_purchase_amount, :usage_restrictions, :user_limit,
                  :unique_per_user, :stackable
  
    index do
      selectable_column
      id_column
      column :code
      column :discount_percentage
      column :max_discount_amount
      column :active
      column :expiry_date
      column :no_of_uses
      actions
    end
  
    form do |f|
      f.inputs 'Coupon Details' do
        f.input :code
        f.input :discount_percentage
        f.input :max_discount_amount
        f.input :active
        f.input :expiry_date
        f.input :no_of_uses
        f.input :description
        f.input :applicability
        f.input :minimum_purchase_amount
        f.input :usage_restrictions
        f.input :user_limit
        f.input :unique_per_user
        f.input :stackable
      end
      f.actions
    end
  end
  