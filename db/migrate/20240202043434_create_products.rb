class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.datetime :available_on
      t.datetime :discontinue_on
      t.decimal :master_price
      t.decimal :cost_price
      t.references :subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
