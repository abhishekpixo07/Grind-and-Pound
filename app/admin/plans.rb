# app/admin/plans.rb
ActiveAdmin.register Plan do
  permit_params :name, :price, :interval, :features

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :interval
    actions
  end

  form do |f|
    f.inputs 'Plan Details' do
      f.input :name
      f.input :price
      f.input :interval, as: :select, collection: Plan.intervals.keys
      f.input :features, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :interval
      row :features
      # Add more rows for additional attributes if needed
    end
  end
end
