class AddColumnToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :razorpay_payment_id, :string
    add_column :orders, :razorpay_order_id, :string
    add_column :orders, :delivery_date, :datetime
  end
end
