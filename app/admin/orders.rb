# app/admin/order.rb

ActiveAdmin.register Order do
  permit_params :status

  filter :id
  filter :user
  filter :status, as: :select, collection: proc { Order.statuses }
  filter :payment_method
  

  index do
    selectable_column
    id_column
    column :user
    column :total_amount
    column :status do |resource|
      status_color = case resource.status
                      when 'Pending'
                        'orange'
                      when 'Processing'
                        'blue'
                      when 'Shipped'
                        'green'
                      when 'Delivered'
                        'purple'
                      else
                        'black'
                      end
        content_tag(:span, resource.status, style: "color: #{status_color}; font-weight: bold; text-decoration: underline;", class: "status-tag")
    end 
    actions
  end

   # Edit view
  form do |f|
    f.inputs "Order Details" do
      f.input :status, as: :select, collection: ['Placed', 'Processing', 'Shipped', 'Delivered', 'Cancelled', 'Returned', 'Refunded', 'Out for Delivery', 'Failed Delivery', 'Awaiting Payment', 'Payment Failed'], include_blank: false
    end
    f.actions
  end

  show do
    attributes_table do
      row :status do |resource|
        status_color = case resource.status
                        when 'Pending'
                          'orange'
                        when 'Processing'
                          'blue'
                        when 'Shipped'
                          'green'
                        when 'Delivered'
                          'purple'
                        else
                          'black'
                        end
          content_tag(:span, resource.status, style: "color: #{status_color}; font-weight: bold; text-decoration: underline;", class: "status-tag")
      end 
      row :user 
      row :sub_total
      row :discount_price
      row :total_amount
      row :grand_total
      row :shipping_fee
      row :delivery_method
      row :payment_method
      row :paid_at
      row :rozarpay_order_id
      row :shipped_at
      row :address_line_1
      row :address_line_2
      row :city
      row :state
      row :postal_code
      row :country 
      row :delivery_date
      row :notes
      row :gift_wrap
      row :tracking_number
      # Add more attributes as needed

      panel 'Order Items' do
        table_for order.order_items do
          column 'Product' do |order_item|
            order_item.product.name
          end
          column :quantity
          column :unit_price
          column :total_price
        end
      end
      
      panel "Payment Information" do
        attributes_table_for resource.payment do
          row :razorpay_payment_id
          row :payment_method do
            order.payment_method
          end          
          row :payment_status
          row :payment_amount do
            number_to_currency(order.payment.payment_amount, unit: '₹') # Adjust currency as needed
          end
          row :created_at
        end
      end if resource.payment.present?

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
