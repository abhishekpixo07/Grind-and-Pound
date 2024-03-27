# app/admin/term_of_use.rb

ActiveAdmin.register TermOfUse do
    menu parent: 'help', label: "Terms of Use", priority: 3

    permit_params :title, :content
  
    index do
      selectable_column
      id_column
      column :title
      column :content do |blog|
        truncate(blog.content, length: 50, separator: ' ')
      end
      actions
    end
  
    form do |f|
      f.inputs 'Voucher Details' do
        f.input :title
        f.input :content, as: :quill_editor
    end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
        row :content
        row :created_at
        row :updated_at
      end
    end
  end
  