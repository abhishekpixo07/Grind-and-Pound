class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :title
      t.text :description
      t.date :expiry_date
      t.string :code

      t.timestamps
    end
  end
end
