class AddBlogCategoryToBlog < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :blog_category, null: true, foreign_key: true

    # Iterate through each Blog and set a random faq_category_id
    Blog.all.each do |blog|
      blog.update(blog_category_id: BlogCategory.pluck(:id).sample)
    end

    # Now, make the column NOT NULL
    change_column_null :blogs, :blog_category_id, false
  end
end
