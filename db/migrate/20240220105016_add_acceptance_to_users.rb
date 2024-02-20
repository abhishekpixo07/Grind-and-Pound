class AddAcceptanceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :acceptance, :boolean
  end
end
