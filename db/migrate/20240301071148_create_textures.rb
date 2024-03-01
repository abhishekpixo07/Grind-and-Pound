class CreateTextures < ActiveRecord::Migration[7.0]
  def change
    create_table :textures do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
