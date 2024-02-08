module Api
    module V1    
      class HomesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
       
        def home
            @products = if params[:keyword].present?
                        Product.where('name ILIKE ?', "%#{params[:keyword]}%")
                      elsif params[:subcategory_id].present?
                        subcategory = Subcategory.find_by(id: params[:subcategory_id])
                        subcategory ? Product.where(subcategory: subcategory) : Product.none
                      else
                        Product.all
                      end 
  
          @subcategories = Subcategory.all
  
          render json: {
            message: 'Products list.',
            data: {
              products: serialize_products(@products),
              subcategories: @subcategories.as_json(except: [:created_at, :updated_at])
            }
          }, status: :ok
        end
  
        private
  
        def serialize_products(products)
          products.as_json(except: [:created_at, :updated_at])
        end
      end
    end
  end
  