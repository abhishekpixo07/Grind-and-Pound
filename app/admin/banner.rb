# app/admin/banner.rb

ActiveAdmin.register Banner do
    permit_params :banner_type, :title, :text_color, :attachment
      
    filter :attachment, as: :file
  
    index do
        selectable_column
        id_column
        column :title
        column :banner_type
        column :text_color
        column :attachment do |banner|
            image_tag url_for(banner.attachment.present? ? banner.attachment : ''), width:100, height:80, skip_pipeline: true
        end
        actions
    end
    
    form do |f|
        banner_1 = Banner.where(banner_type: "banner").count
        banner_2 = Banner.where(banner_type: "advertise").count
        f.inputs 'Banner Details' do
            if banner_1 >= 4 && banner_2 >= 4
                f.input :banner_type, as: :select, collection: ["promotion"]
            elsif banner_1 >= 4
                f.input :banner_type, as: :select, collection: ["promotion", "advertise"]
            elsif banner_2 >= 4
                f.input :banner_type, as: :select, collection: ["banner", "promotion"]
            else
                f.input :banner_type, as: :select, collection: ["banner", "advertise", "promotion"]
            end
        f.input :title
        f.input :text_color
        f.input :attachment, as: :file
        end
        f.actions
      end
      
    show do
        attributes_table do
            row :title
            row :banner_type
            row :text_color
            row :created_at
            row :updated_at
            row :attachment do |banner|
            image_tag url_for(banner.attachment.present? ? banner.attachment : ''), width:100, height:80, skip_pipeline: true
            end
        end
    end
end