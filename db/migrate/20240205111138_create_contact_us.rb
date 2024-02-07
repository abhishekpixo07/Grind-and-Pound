# db/migrate/xxxxxx_create_contact_us.rb

class CreateContactUs < ActiveRecord::Migration[7.0]
  def change
    create_table :contact_us do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :subject
      t.text :address
      t.text :form_message
      t.string :status, default: 'new'
      t.text :response
      t.timestamps
    end
  end
end
