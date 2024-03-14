ActiveAdmin.register Store do
    permit_params :name, :address_line_1, :address_line_2, :city, :state, :postal_code, :country, :phone_number
    menu label: 'Store Location'
    config.batch_actions = false
   
    actions :all, except: :new
   
    controller do
       def new
         if Store.count == 1
           redirect_to admin_stores_path, notice: 'Only one store can be created.'
         else
           super
         end
       end
    end
   
    index do
       selectable_column
       id_column
       column :name
       column :city
       column :state
       column :country
       actions
    end
   
    form do |f|
       f.inputs 'Store Details' do
         f.input :name
         f.input :address_line_1
         f.input :address_line_2
         f.input :city
         f.input :state
         f.input :postal_code
         f.input :country, as: :string
         f.input :phone_number
       end
       f.actions
    end
   end
   