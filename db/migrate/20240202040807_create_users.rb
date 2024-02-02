class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :country_code
      t.string :profile_pic
      t.string :otp
      t.boolean :active

      t.timestamps
    end
  end
end
