class AddColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :sub_total, :decimal
    add_column :orders, :discount_amount, :decimal
    add_column :orders, :shipping_fee, :decimal
    add_column :orders, :grand_total, :decimal
    add_column :orders, :delivery_method, :decimal
  end
end
