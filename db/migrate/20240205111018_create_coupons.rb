# db/migrate/xxxxxx_create_coupons.rb

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :discount_percentage, precision: 5, scale: 2
      t.decimal :max_discount_amount, precision: 10, scale: 2
      t.boolean :active, default: true
      t.date :expiry_date
      t.integer :no_of_uses
      t.text :description
      t.string :applicability
      t.decimal :minimum_purchase_amount, precision: 10, scale: 2
      t.text :usage_restrictions
      t.integer :user_limit
      t.boolean :unique_per_user
      t.boolean :stackable
      t.timestamps
    end
  end
end
