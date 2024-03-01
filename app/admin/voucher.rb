# app/admin/vouchers.rb

ActiveAdmin.register Voucher do
    permit_params :title, :description, :expiry_date, :code
  
    index do
      selectable_column
      id_column
      column :title
      column :description do |voucher|
        truncate(voucher.description, length: 50, separator: ' ')
      end
      column :expiry_date
      column :code
      actions
    end
  
    form do |f|
      f.inputs 'Voucher Details' do
        f.input :title
        f.input :description, as: :text
        f.input :expiry_date
        f.input :code
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
        row :description
        row :expiry_date
        row :code
        row :created_at
        row :updated_at
      end
    end
  end
  