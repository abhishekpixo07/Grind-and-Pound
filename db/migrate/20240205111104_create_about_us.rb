# db/migrate/xxxxxx_create_about_us.rb

class CreateAboutUs < ActiveRecord::Migration[7.0]
  def change
    create_table :about_us do |t|
      t.string :title
      t.text :content
      t.string :image_url
      t.datetime :published_at
      t.timestamps
    end
  end
end
