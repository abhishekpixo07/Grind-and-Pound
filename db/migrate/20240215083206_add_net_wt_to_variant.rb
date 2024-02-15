class AddNetWtToVariant < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :net_wt, :string
    add_column :variants, :unit, :string
  end
end
