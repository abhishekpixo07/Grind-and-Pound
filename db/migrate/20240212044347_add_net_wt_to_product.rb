class AddNetWtToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :net_wt, :string
  end
end
