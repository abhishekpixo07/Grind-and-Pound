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

      # Display Payment Information
      if order.payment.present?
        row :payment_status do
          order.payment.payment_status
        end
        row :payment_amount do
          number_to_currency(order.payment.payment_amount, unit: '₹') # Adjust currency as needed
        end
        row :created_at do
          order.payment.created_at
        end
        row :updated_at do
          order.payment.updated_at
        end
      end
    end
  end
end
