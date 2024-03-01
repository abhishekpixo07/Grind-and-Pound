class AddDiscountPriceToVariant < ActiveRecord::Migration[7.0]
  def change
    add_column :variants, :discount_price, :float
  end
end
