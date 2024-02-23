# app/controllers/carts_controller.rb
module Api
  module V1     
    class CartsController < ApplicationController
        before_action :authenticate_user_from_token!
        before_action :current_user
        before_action :set_cart, only: [:show, :update, :destroy]
      
        def index
          @cart = @current_user.cart
          render json: @cart
        end
      
        def show
          render json: @cart
        end
      
        def create
          @cart = Cart.new(cart_params)
          @cart.user = @current_user
          if @cart.save
            render json: @cart, status: :created
          else
            render json: @cart.errors, status: :unprocessable_entity
          end
        end  
      
        def update
          if @cart.update(cart_params)
            render json: @cart
          else
            render json: @cart.errors, status: :unprocessable_entity
          end
        end
      
        def destroy
          @cart.destroy
          head :no_content
        end
      
        private
      
        def set_cart
          @cart = Cart.find(params[:id])
        end
      
        def cart_params
          params.require(:cart).permit(:user_id, :product_id, :quantity, :purchased)
        end
    end
  end
end  
    