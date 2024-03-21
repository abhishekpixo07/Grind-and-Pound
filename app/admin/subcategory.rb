ActiveAdmin.register Subcategory do
    menu parent: 'Category', label: 'Subcategory', priority: 2
    permit_params :name, :image, :description, :category_id

    action_item :add_product, only: :show do
      link_to 'Add Product', new_admin_product_path
    end

    filter :name
    filter :category, as: :select, collection: -> { Category.pluck(:name, :id) }

  
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
        f.input :category
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
        row :category
      end
    end
  end
  