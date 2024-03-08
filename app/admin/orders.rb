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

      panel "Payment Information" do
        attributes_table_for resource.payment do
          row :payment_method do
            order.payment_method
          end          
          row :payment_status
          row :payment_amount do
            number_to_currency(order.payment.payment_amount, unit: '₹') # Adjust currency as needed
          end
          row :created_at
          row :updated_at
        end
      end if resource.payment.present?

      panel "Shipping Address" do
        attributes_table_for resource.shipping_address do
          row :address_line_1
          row :address_line_2
          row :city
          row :state
          row :postal_code
          row :country
        end
      end if resource.shipping_address.present?

      panel "User Details" do
        attributes_table_for resource.user do
          row :email
          row :first_name
          row :last_name
          row :phone_number
          # Add more user attributes as needed
        end
      end

    end
  end
end
