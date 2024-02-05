# app/admin/order.rb

ActiveAdmin.register Order do

  index do
    selectable_column
    id_column
    column :user
    column :total_amount
    column :status
    actions
  end

  show do
    attributes_table do
      row :user
      row :total_amount
      row :status
      row :payment_method
      row :paid_at
      row :shipped_at
      row :notes
      row :gift_wrap
      row :tracking_number
      # Add more attributes as needed
    end
    active_admin_comments
  end
end
