# db/migrate/20240304074227_add_faq_category_to_faq.rb
class AddFaqCategoryToFaq < ActiveRecord::Migration[7.0]
  def change
    add_reference :faqs, :faq_category, null: true, foreign_key: true

    # Iterate through each FAQ and set a random faq_category_id
    Faq.all.each do |faq|
      faq.update(faq_category_id: FaqCategory.pluck(:id).sample)
    end

    # Now, make the column NOT NULL
    change_column_null :faqs, :faq_category_id, false
  end
end
