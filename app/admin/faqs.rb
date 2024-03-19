ActiveAdmin.register Faq do
  menu parent: 'FAQ', label: 'Faqs', priority: 2

  permit_params :question, :answer, :faq_category_id

  index do
    selectable_column
    id_column
    column :question
    column :answer do |faq|
      truncate(faq.answer, length: 50, separator: ' ')
    end
    column :faq_category
    actions
  end

  filter :question
  filter :answer

  form do |f|
    f.inputs 'FAQ Details' do
      f.input :faq_category
      f.input :question
      f.input :answer, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :question
      row :answer
      row :faq_category
      row :created_at
      row :updated_at
    end
  end
  
end
