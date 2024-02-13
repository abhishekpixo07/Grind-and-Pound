# app/admin/product.rb

ActiveAdmin.register Product do
  permit_params :name, :description, :available_on, :net_wt, :unit, :discontinue_on, :master_price, :cost_price, :subcategory_id, :attachment
    
    filter :name
    filter :available_on
    filter :discontinue_on
    filter :master_price
    filter :subcategory
    filter :attachment, as: :file

    index do
      selectable_column
      id_column
      column :name
      column :description do |product|
        truncate(product.description, length: 50, separator: ' ')
      end
      column :available_on
      column 'net_wt' do |pro|
        pro.unit.present? ? pro.net_wt + pro.unit : ""
      end
      column :discontinue_on
      column :master_price
      column :cost_price
      column :subcategory
      column :attachment do |pro|
        image_tag url_for(pro.attachment.present? ? pro.attachment : ''), width:100, height:80, skip_pipeline: true
      end
      actions
    end
  
    form do |f|
      f.inputs 'Product Details' do
        f.input :name
        f.input :description
        f.input :net_wt
        f.input :unit, :as => :select, :collection => ["g","kg"]
        f.input :available_on, as: :string, input_html: { class: 'datepicker' }
        f.input :discontinue_on, as: :string, input_html: { class: 'datepicker' }
        f.input :master_price
        f.input :cost_price
        f.input :subcategory
        f.input :attachment, as: :file
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :name
        row :description
        row :available_on
        row 'Net wt' do |pro|
          pro.unit.present? ? pro.net_wt + pro.unit : ""
        end
        row :discontinue_on
        row :master_price
        row :cost_price
        row :subcategory
        row :created_at
        row :updated_at
        row :attachment do |pro|
          image_tag url_for(pro.attachment.present? ? pro.attachment : ''), width:100, height:80, skip_pipeline: true
        end
      end
    end
  end