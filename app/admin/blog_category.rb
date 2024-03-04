ActiveAdmin.register BlogCategory do
    menu parent: 'Blog', label: 'Blog Category', priority: 1

    permit_params :title
  
    index do
      selectable_column
      id_column
      column :title
      actions
    end
  
    filter :title
  
    form do |f|
      f.inputs 'Blog category' do
        f.input :title
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
      end
      panel 'Blogs' do
        table_for blog_category.blogs do
          column :question
          column :answer
        end
      end
    end
    
  end
  