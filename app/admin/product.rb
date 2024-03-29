# app/admin/product.rb

ActiveAdmin.register Product do

  menu parent: 'Category', label: 'Product', priority: 3
  
  permit_params :name, :description, :available_on, :net_wt, :unit, :discontinue_on, :master_price, :cost_price, :subcategory_id, textures_attributes: [:id, :name, :_destroy], product_properties_attributes: [:id, :name, :value, :_destroy], variants_attributes: [:id, :sku, :price, :discount_price, :net_wt, :unit, :quantity, :_destroy], product_images_attributes: [:id, :attachment, :_destroy], available_zip_codes: []

    
    filter :name
    filter :available_on
    filter :discontinue_on
    filter :master_price
    filter :subcategory
    

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
      column :subcategory
      column 'Properties' do |product|
        properties_list = product.product_properties.map.with_index(1) do |prop, index|
          "<li> #{prop.name.titleize}: #{prop.value}</li>"
        end.join('').html_safe
      
        properties_list
      end   
      column 'Texture' do |product|
        texture = product.textures.map.with_index(1) do |tex, index|
          "<li> Title: #{tex.name.titleize}</li>"
        end.join('').html_safe
      
        texture
      end     
      actions
    end
  
    form do |f|
      f.inputs 'Product Details' do
        f.input :subcategory
        f.input :name
        f.input :description, as: :quill_editor
        f.input :net_wt
        f.input :unit, :as => :select, :collection => ["g","kg"]
        f.input :available_on, as: :datetime_picker
        f.input :discontinue_on, as: :datetime_picker
        f.input :master_price
        f.input :cost_price
        f.inputs 'Available Zip Codes' do
          f.input :available_zip_codes, as: :string, input_html: { value: f.object.available_zip_codes.join(','), multiple: true }
        end     
        f.inputs 'Product Texture' do
          f.has_many :textures, heading: false, allow_destroy: true do |nested_f|
            nested_f.input :name
          end
        end   
        f.inputs 'Product Properties' do
          f.has_many :product_properties, heading: false, allow_destroy: true do |nested_f|
            nested_f.input :name
            nested_f.input :value
          end
        end
        f.inputs 'Product Variants' do
          f.has_many :variants, heading: false, allow_destroy: true do |var|
            var.input :sku
            var.input :price
            var.input :discount_price
            var.input :net_wt
            var.input :quantity
            var.input :unit, :as => :select, :collection => ["g","kg"]
          end
        end
        f.inputs 'Product Images' do
          f.has_many :product_images, heading: false, allow_destroy: true do |pi|
            if pi.object&.attachment.attached?
              pi.input :attachment, as: :file, hint: (image_tag(url_for(pi.object.attachment), width: 100, height: 80))
            else
              pi.input :attachment, as: :file
            end
          end
        end        
      end
      f.actions
    end
  
    show do
      attributes_table do
        row :name
        row :description do |pro|
          raw pro.description.to_s
        end
        row :available_on
        row 'Net wt' do |pro|
          pro.unit.present? ? pro.net_wt + pro.unit : ""
        end
        row :discontinue_on
        row :master_price
        row :cost_price
        row :subcategory
        row :available_zip_codes do |product|
          product.available_zip_codes.join(', ')
        end
        row :created_at
        row :updated_at
        panel 'Textures' do
          ul do
            product.textures.each_with_index do |tex, index|
              li style: 'list-style-type: disc;' do
                "Title: #{tex.name.titleize}"
              end
            end
          end
        end
        
        panel 'Properties' do
          ul do
            product.product_properties.each_with_index do |prop, index|
              li style: 'list-style-type: square;' do
                "#{prop.name.titleize}: #{prop.value}"
              end
            end
          end
        end
        
        panel 'Variants' do
          ul do
            product.variants.each_with_index do |var, index|
              li style: 'list-style-type: circle;' do
                "Net Weight: #{var.net_wt + var.unit}<br>
                Price: #{var.price}<br>
                Discount Price: #{var.discount_price}<br>
                Quantity: #{var.quantity}".html_safe
              end
            end
          end
        end
        
        panel 'Product Images' do
          div style: 'display: flex; flex-wrap: nowrap; overflow-x: auto;' do
            product.product_images.each_with_index do |pi, index|
              div style: 'flex: 0 0 auto; margin-right: 10px;' do
                if pi.attachment.present?
                  image_tag(url_for(pi.attachment), width: 100, height: 80, skip_pipeline: true)
                else
                  "No image available"
                end
              end
            end
          end
        end          
      end
    end
  end