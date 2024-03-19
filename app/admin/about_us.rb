ActiveAdmin.register AboutUs do
  permit_params :title, :content, :image_url, :published_at

  index do
    selectable_column
    id_column
    column :title
    column :published_at
    actions
  end

  form do |f|
    f.inputs "About Us Details" do
      f.input :title
      f.input :content, as: :quill_editor
      f.input :image_url
      f.input :published_at, as: :datepicker
    end
    f.actions
  end
end
