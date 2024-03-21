# app/admin/plans.rb
ActiveAdmin.register Plan do
  permit_params :name, :price, :interval, :features

  filter :name
  filter :price
  filter :subscriptions, as: :select, label: 'Subscribed User', collection: -> { 
    Subscription.includes(:user, :plan).map { |subscription| [subscription.user.first_name, subscription.plan.name, subscription.id] }.uniq
  }

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :interval
    column :features
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
      row "Subscribed Users" do |plan|
        plan.subscriptions.map { |subscription| link_to(subscription.user.first_name, admin_user_path(subscription.user)) }.join(", ").html_safe
      end
      # Add more rows for additional attributes if needed
    end
  end
end
