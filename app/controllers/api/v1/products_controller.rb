
module Api
    module V1 
        class Api::V1::ProductsController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_product, only: [:show, :check_availability]
            before_action :set_active_storage_url_options

            def index
                @products = filter_products
                @subcategories = Subcategory.all
                @categories = Category.all
                render json: { data: 'products list.', products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer), subcategories: @subcategories.as_json(only: [:id, :name]), categories: @categories.as_json(only: [:id, :name]) }, status: :ok
            end  
        
            def show
                products_in_same_subcategory = Product.where(subcategory_id: @product.subcategory_id).where.not(id: @product.id)
              
                render json: {
                  data: 'product details.',
                  product: ActiveModelSerializers::SerializableResource.new(@product, each_serializer: ProductSerializer),
                  related_products: ActiveModelSerializers::SerializableResource.new(products_in_same_subcategory, each_serializer: ProductSerializer)
                }, status: :ok
            end
              

            def check_availability
                zip_code = params[:zip_code].to_s            
                if @product && @product.available_for_zip_code?(zip_code)
                  render json: { available: true, product: @product }, status: :ok
                else
                  render json: { available: false }, status: :not_found
                end
            end
        
            private
        
            def set_product
            @product = Product.find_by_id(params[:id]) if params[:id].present?
            render json: { error: 'product not found.' }, status: :unprocessable_entity if !@product.present?
            end

            def filter_products
                return Product.all unless filter_criteria_present?
                products = Product.all
                products = products.where('name ILIKE ?', "%#{params[:keyword]}%") if params[:keyword].present?
                if params[:subcategory_id].present?
                  subcategory = Subcategory.find_by(id: params[:subcategory_id])
                  products = subcategory ? products.filter_by_subcategory(subcategory.id) : Product.none
                end
                if params[:min_price].present? && params[:max_price].present?
                  products = products.filter_by_price_range(params[:min_price].to_f, params[:max_price].to_f)
                end
                products = products.filter_by_net_wt_and_unit(params[:net_wt_unit]) if params[:net_wt_unit].present?
                products
              end
              
              
            def filter_criteria_present?
                params[:keyword].present? || params[:subcategory_id].present? || (params[:min_price].present? && params[:max_price].present?) || params[:net_wt_unit].present?
            end

        end
    end
end