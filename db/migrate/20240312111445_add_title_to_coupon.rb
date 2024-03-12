class AddTitleToCoupon < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :title, :string
  end
end
