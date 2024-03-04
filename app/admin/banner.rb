# app/admin/banner.rb

ActiveAdmin.register Banner do
    permit_params :title, :text_color, :attachment
      
    filter :attachment, as: :file
  
    index do
        selectable_column
        id_column
        column :title
        column :text_color
        column :attachment do |banner|
            image_tag url_for(banner.attachment.present? ? banner.attachment : ''), width:100, height:80, skip_pipeline: true
        end
        actions
    end
    
    form do |f|
        f.inputs 'Baneer Details' do
            f.input :title
            f.input :text_color
            f.input :attachment, as: :file
        end
        f.actions
    end
    
    show do
        attributes_table do
            row :title
            row :text_color
            row :created_at
            row :updated_at
            row :attachment do |banner|
            image_tag url_for(banner.attachment.present? ? banner.attachment : ''), width:100, height:80, skip_pipeline: true
            end
        end
    end
end