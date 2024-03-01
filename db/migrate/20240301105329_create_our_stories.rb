class CreateOurStories < ActiveRecord::Migration[7.0]
  def change
    create_table :our_stories do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
