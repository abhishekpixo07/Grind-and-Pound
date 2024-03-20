class CreateTermsOfSales < ActiveRecord::Migration[7.0]
  def change
    create_table :terms_of_sales do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
