class AddColumnToShippingAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :country_code, :string
    add_column :shipping_addresses, :phone_number, :string
    add_column :shipping_addresses, :mail, :string
    rename_column :shipping_addresses, :full_name, :first_name
    add_column :shipping_addresses, :title, :string
    add_column :shipping_addresses, :last_name, :string
  end
end
