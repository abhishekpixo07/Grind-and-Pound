# app/admin/product.rb

ActiveAdmin.register Product do
    permit_params :name, :description, :available_on, :discontinue_on,
                  :master_price, :cost_price, :subcategory_id
  
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :available_on
      column :discontinue_on
      column :master_price
      column :cost_price
      column :subcategory
      actions
    end
  
    form do |f|
      f.inputs 'Product Details' do
        f.input :name
        f.input :description
        f.input :available_on
        f.input :discontinue_on
        f.input :master_price
        f.input :cost_price
        f.input :subcategory
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :name
        row :description
        row :available_on
        row :discontinue_on
        row :master_price
        row :cost_price
        row :subcategory
        row :created_at
        row :updated_at
      end
    end
  end
  