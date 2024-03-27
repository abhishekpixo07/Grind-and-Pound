class AddSubscriptionToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :subscription, foreign_key: true, optional: true
    change_column :payments, :order_id, :integer, null: true
  end
end
