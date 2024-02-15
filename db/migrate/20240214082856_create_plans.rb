class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price
      t.string :billing_interval
      t.text :features

      t.timestamps
    end
  end
end
