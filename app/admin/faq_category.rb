ActiveAdmin.register FaqCategory do
    menu parent: 'FAQ', label: 'Faq Category', priority: 1

    permit_params :title
  
    index do
      selectable_column
      id_column
      column :title
      actions
    end
  
    filter :title
  
    form do |f|
      f.inputs 'FAQ category' do
        if f.object.new_record?
          f.input :title
        else
          f.input :title, input_html: { disabled: true } # Make title non-editable in edit form
        end
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
      end
      panel 'faq' do
        table_for faq_category.faqs do
          column :question
          column :answer
        end
      end
    end
    
  end
  