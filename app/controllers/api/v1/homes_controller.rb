module Api
    module V1    
      class HomesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
        before_action :set_active_storage_url_options

       
        def home
          @products = if params[:keyword].present?
                        Product.where('name ILIKE ?', "%#{params[:keyword]}%")
                      elsif params[:subcategory_id].present?
                        subcategory = Subcategory.find_by(id: params[:subcategory_id])
                        subcategory ? Product.filter_by_subcategory(subcategory.id) : Product.none
                      else
                        Product.all
                      end 
      
          @subcategories = Subcategory.all
      
          render json: {
            message: 'Products list.',
            data: {
              products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
              subcategories: @subcategories.as_json(except: [:created_at, :updated_at])
            }
          }, status: :ok
        end
        
        private

        def set_active_storage_url_options
          ActiveStorage::Current.url_options = {
            host: request.base_url
            # Add any other options you need, such as protocol, port, etc.
          }
        end

      end
    end
  end
  