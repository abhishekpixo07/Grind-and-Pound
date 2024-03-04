ActiveAdmin.register Subcategory do
    menu parent: 'Category', label: 'Subcategory', priority: 2
    permit_params :name, :image, :description, :category_id
  
    index do
      selectable_column
      id_column
      column :name
      column :image
      column :description
      column :category
      actions
    end
  
    form do |f|
      f.inputs 'Subcategory Details' do
        f.input :name
        f.input :image
        f.input :description
        f.input :category
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :name
        row :image
        row :description
        row :category
      end
    end
  end
  