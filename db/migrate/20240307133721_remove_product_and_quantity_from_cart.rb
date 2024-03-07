class RemoveProductAndQuantityFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :product, null: false, foreign_key: true
    remove_column :carts, :quantity, :integer
  end
end
