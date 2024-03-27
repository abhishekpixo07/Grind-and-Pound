class AddAddressDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :shipping_address, null: false, foreign_key: true
    add_column :orders, :address_line_1, :string
    add_column :orders, :address_line_2, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :postal_code, :string
    add_column :orders, :country, :string
  end
end
