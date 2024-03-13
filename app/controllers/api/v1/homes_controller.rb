module Api
    module V1    
      class HomesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
        before_action :set_active_storage_url_options

       
        def home
          @all_products = Product.joins(:variants, :product_images, :textures, :product_properties).order(created_at: :desc).distinct
          if params[:keyword].present?
            @products = @all_products.where('products.name ILIKE ?', "%#{params[:keyword]}%")
          elsif params[:subcategory_id].present?
            subcategory = Subcategory.find_by(id: params[:subcategory_id])
            @products = subcategory ? @all_products.where(subcategory_id: subcategory.id) : []
          else
            @products = @all_products
          end
        
          @subcategories = Subcategory.all
          @categories = Category.all
        
          render json: {
            message: 'Products list.',
            data: {
              products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
              subcategories: @subcategories.as_json(only: [:id, :name]),
              categories: @categories.as_json(only: [:id, :name])
            }
          }, status: :ok
        end
        
        
      end
    end
  end
  