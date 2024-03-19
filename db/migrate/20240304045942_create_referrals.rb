class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.references :referrer, null: false, foreign_key: true
      t.references :referred_user, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
    add_index :referrals, :email, unique: true
  end
end
