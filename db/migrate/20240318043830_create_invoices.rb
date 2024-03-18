class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
