class AddTypeToBanner < ActiveRecord::Migration[7.0]
  def change
    add_column :banners, :banner_type, :string
  end
end
