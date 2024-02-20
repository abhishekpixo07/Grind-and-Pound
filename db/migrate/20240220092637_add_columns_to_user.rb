class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :doa, :datetime
    add_column :users, :last_name, :string
    add_column :users, :title, :string
    rename_column :users, :name, :first_name
    add_column :users, :pin_code, :integer
    add_column :users, :district, :string
  end
end
