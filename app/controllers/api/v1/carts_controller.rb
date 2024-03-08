# app/controllers/api/v1/carts_controller.rb
module Api
  module V1
    class CartsController < ApplicationController
      before_action :authenticate_user_from_token!
      before_action :current_user
      before_action :set_cart, only: [:show, :update]
      before_action :set_cart_item, only: [:destroy]

      def show
        render json: @cart
      end

      def create
        @cart = @current_user.cart || Cart.create(user: @current_user)
        if @cart.persisted?
          product = Product.find(params[:product_id])
          quantity = params[:quantity].to_i
      
          # Check if the cart already has the product, update quantity if so
          cart_item = @cart.cart_items.find_or_initialize_by(product: product)
          cart_item.update(quantity: quantity)
      
          render json: {
            cart: ActiveModelSerializers::SerializableResource.new(@cart, serializer: CartSerializer)
          }, status: :created
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end
      
      def update
        product = Product.find(params[:product_id])
        quantity = params[:quantity].to_i
        cart_item = @cart.cart_items.find_by(product: product)
        if cart_item
          cart_item.update(quantity: quantity)
        else
          @cart.cart_items.create(product: product, quantity: quantity)
        end
        render json: @cart
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.message }, status: :not_found
      end

      def destroy
        @cart_item.destroy
        render json: { message: 'Cart Item cleared successfully.' }, status: :ok
      end

      private

      def set_cart
        @cart = @current_user.cart
        render json: { error: 'cart not found.' }, status: :unprocessable_entity if !@cart.present?
      end

      def set_cart_item
        @cart_item = CartItem.find_by_id(params[:id])
        render json: { error: 'CartItem not found.' }, status: :unprocessable_entity if !@cart_item.present?
      end
    end
  end
end
