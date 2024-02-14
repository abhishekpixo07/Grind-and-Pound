
module Api
    module V1 
        class Api::V1::ProductsController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_product, only: [:show]

            def index
                @products = filter_products
                @subcategories = Subcategory.all
                @categories = Category.all
                render json: { data: 'products list.', products: @products, subcategories: @subcategories.as_json(only: [:id, :name]), categories: @categories.as_json(only: [:id, :name]) }, status: :ok
            end  
        
            def show
                render json: { data: 'product details.', product: @product }, status: :ok
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