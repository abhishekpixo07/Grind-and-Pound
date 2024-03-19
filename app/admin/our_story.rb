# app/admin/our_story.rb

ActiveAdmin.register OurStory do
    permit_params :title, :description, :image
  
    index do
      selectable_column
      id_column
      column :title
      column :description do |story|
        truncate(story.description, length: 50, separator: ' ')
      end
      actions
    end
  
    form do |f|
      f.inputs 'Voucher Details' do
        f.input :title
        f.input :description, as: :quill_editor
        f.input :image, as: :file
    end
      f.actions
    end
  
    show do
      attributes_table do
        row :title
        row :description
        row :image do |our_story|
            image_tag(our_story.image.url, width: 200) if our_story.image.present?
        end
        row :created_at
        row :updated_at
      end
    end
  end
  