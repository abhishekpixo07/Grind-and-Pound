class AddColumnToBanner < ActiveRecord::Migration[7.0]
  def change
    add_column :banners, :title, :string
    add_column :banners, :text_color, :string
  end
end
