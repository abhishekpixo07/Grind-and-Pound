ActiveAdmin.register Faq do

  permit_params :question, :answer

  index do
    selectable_column
    id_column
    column :question
    column :answer
    actions
  end

  filter :question
  filter :answer

  form do |f|
    f.inputs 'FAQ Details' do
      f.input :question
      f.input :answer, as: :text
    end
    f.actions
  end

  show do
    attributes_table do
      row :question
      row :answer
      row :created_at
      row :updated_at
    end
  end
  
end
