# app/admin/category.rb
ActiveAdmin.register Category do
  menu parent: 'Category', label: 'Category', priority: 1
  permit_params :name, :image, :description

  index do
    selectable_column
    id_column
    column :name
    column :image
    column :description
    actions
  end

  form do |f|
    f.inputs 'Category Details' do
      f.input :name
      f.input :image
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :image
      row :description
    end

    panel 'Subcategories' do
      table_for category.subcategories do
        column :name
        column :description
      end
    end
  end
end
