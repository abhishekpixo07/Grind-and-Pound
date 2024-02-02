# app/admin/variant.rb

ActiveAdmin.register Variant do
    permit_params :sku, :price, :product_id
  
    index do
      selectable_column
      id_column
      column :sku
      column :price
      column :product
      actions
    end
  
    form do |f|
      f.inputs 'Variant Details' do
        f.input :sku
        f.input :price
        f.input :product
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :sku
        row :price
        row :product
        row :created_at
        row :updated_at
      end
    end
  end
  