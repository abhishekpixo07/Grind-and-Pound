class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :variants do |t|
      t.string :sku
      t.decimal :price
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
