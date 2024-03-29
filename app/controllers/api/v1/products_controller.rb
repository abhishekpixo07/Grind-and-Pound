
module Api
    module V1 
        class Api::V1::ProductsController < ApplicationController
            skip_before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_product, only: [:show, :check_availability]
            before_action :find_variant, only: [:check_stock]

            def index
                @products = filter_products
                @subcategories = Subcategory.all
                @categories = Category.all
                render json: { data: 'products list.', products: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer), subcategories: @subcategories.as_json(only: [:id, :name]), categories: @categories.as_json(only: [:id, :name]) }, status: :ok
            end  

            def search
              @products = []
              if params[:name].present?
                @products = Product.where("name ILIKE ?", "%#{params[:name]}%").order(created_at: :desc)
              end
              render json: {
                  data: 'products list.',
                  product: ActiveModelSerializers::SerializableResource.new(@products, each_serializer: ProductSerializer),
                }, status: :ok
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
                  render json: { available: true, message: "Delivery Available", product: @product}, status: :ok
                else
                  render json: { available: false }, status: :not_found
                end
            end
        
            def check_stock
              if @variant && @variant.quantity > 0
                render json: { in_stock: true, quantity: @variant.quantity }
              else
                render json: { in_stock: false }
              end
            end

            def available_zip_codes
              zip_codes = Product.pluck(:available_zip_codes).flatten.uniq
              formatted_zip_codes = zip_codes.flat_map { |codes| codes.split(",") }.uniq
              
              pin_code = params[:pin_code]
              available_products = Product.where(":pin_code = ANY (available_zip_codes)", pin_code: pin_code)
              
              if available_products.any?
                render json: {
                  zip_codes: formatted_zip_codes,
                  message: 'Delivery available!',
                  status: true
                }, status: :ok
              else
                render json: {
                  zip_codes: formatted_zip_codes,
                  message: 'We apologize, but we do not offer service in your area!',
                  status: false
                }, status: :ok
              end
            end            
             

            private
        
            def set_product
              @product = Product.find_by_id(params[:id]) if params[:id].present?
              render json: { error: 'product not found.' }, status: :unprocessable_entity if !@product.present?
            end

            def find_variant
              @variant = Variant.find_by(id: params[:id])
            end

            def filter_products
              return Product.joins(:variants, :product_images, :textures, :product_properties).order(created_at: :desc).distinct unless filter_criteria_present?
              
              products = Product.joins(:variants, :product_images, :textures, :product_properties).order(created_at: :desc).distinct
              
              products = products.where('products.name ILIKE ?', "%#{params[:keyword]}%") if params[:keyword].present?
              
              if params[:subcategory_id].present?
                subcategory = Subcategory.find_by(id: params[:subcategory_id])
                products = subcategory ? products.filter_by_subcategory(subcategory.id) : Product.none
              end
              
              if params[:min_price].present? && params[:max_price].present?
                products = products.filter_by_price_range(params[:min_price].to_f, params[:max_price].to_f)
              end
              
              products = products.filter_by_net_wt_and_unit(params[:net_wt_unit]) if params[:net_wt_unit].present?
            
              products.reject { |product| product.variants.empty? && product.product_images.empty? && product.textures.empty? && product.product_properties.empty? }
            end
                          
              
            def filter_criteria_present?
                params[:keyword].present? || params[:subcategory_id].present? || (params[:min_price].present? && params[:max_price].present?) || params[:net_wt_unit].present?
            end

        end
    end
end