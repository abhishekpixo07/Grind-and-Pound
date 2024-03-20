# app/admin/term_of_sale.rb

ActiveAdmin.register TermsOfSale do
    menu parent: 'help', label: "Terms of Sale", priority: 2

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
  