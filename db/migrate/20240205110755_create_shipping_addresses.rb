# db/migrate/xxxxxx_create_shipping_addresses.rb

class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :user, foreign_key: true
      t.string :full_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.timestamps
    end
  end
end
