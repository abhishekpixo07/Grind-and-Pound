class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :dob, :datetime
    add_column :users, :address, :text
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :gender, :string
  end
end
