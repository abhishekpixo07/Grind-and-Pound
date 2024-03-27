ActiveAdmin.register AboutUs do
  permit_params :title, :content, :image_url, :published_at
  
  filter :title
  filter :published_at

  index do
    selectable_column
    id_column
    column :title
    column :published_at
    actions
  end

  form do |f|
    f.inputs "About Us Details" do
      if f.object.new_record?
        f.input :title
      else
        f.input :title, input_html: { disabled: true } # Make title non-editable in edit form
      end
      f.input :content, as: :quill_editor
      f.input :image_url
      f.input :published_at, as: :datepicker
    end
    f.actions
  end
end
