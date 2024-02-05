# db/migrate/xxxxxx_create_orders.rb

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :shipping_address, foreign_key: true
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status
      t.string :payment_method
      t.datetime :paid_at
      t.datetime :shipped_at
      t.text :notes
      t.boolean :gift_wrap, default: false
      t.string :tracking_number
      t.timestamps
    end
  end
end
