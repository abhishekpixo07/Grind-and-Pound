class CreateTermOfUses < ActiveRecord::Migration[7.0]
  def change
    create_table :term_of_uses do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
