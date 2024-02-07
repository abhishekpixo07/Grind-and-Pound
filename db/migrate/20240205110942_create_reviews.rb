# db/migrate/xxxxxx_create_reviews.rb

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.text :content
      t.integer :rating
      t.boolean :approved, default: false
      t.datetime :reviewed_at
      t.timestamps
    end
  end
end
