class CreateInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :invoice_items do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
