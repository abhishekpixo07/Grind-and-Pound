class AddDefaultToShippingAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :shipping_addresses, :default, :boolean
  end
end
