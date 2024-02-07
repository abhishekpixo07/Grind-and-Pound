
module Api
    module V1 
        class Api::V1::ProductsController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_product, only: [:show]

            def index
                if params[:keyword].present?
                    @products = Product.where('name ILIKE ?', "%#{params[:keyword]}%")
                else
                    @products = Product.all
                end 
                render json: { data: 'products list.', products: @products }, status: :ok
            end
        
            def show
                render json: { data: 'product details.', product: @product }, status: :ok
            end
        
            private
        
            def set_product
            @product = Product.find_by_id(params[:id]) if params[:id].present?
            render json: { error: 'product not found.' }, status: :unprocessable_entity if !@product.present?
            end

        end
    end
end