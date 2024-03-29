# app/controllers/shipping_addresses_controller.rb
module Api
  module V1 
    class ShippingAddressesController < ApplicationController
        before_action :authenticate_user_from_token!
        before_action :current_user
        before_action :set_shipping_address, only: [:show, :update, :destroy]
      
        def index
          @shipping_addresses = @current_user.shipping_addresses.order(created_at: :desc)
          @shipping_addresses.present? ? (render json: @shipping_addresses) : (render json: { error: 'shipping addresses not found.' }, status: :unprocessable_entity)
        end
      
        def show
          render json: @shipping_address
        end
      
        def create
          @shipping_address = ShippingAddress.new(shipping_address_params)
          @shipping_address.user = @current_user
          if @shipping_address.save
            render json: @shipping_address, status: :created
          else
            render json: @shipping_address.errors, status: :unprocessable_entity
          end
        end
      
        def update
          if @shipping_address.update(shipping_address_params)
            render json: @shipping_address
          else
            render json: @shipping_address.errors, status: :unprocessable_entity
          end
        end
      
        def destroy
          @shipping_address.destroy
          render json: { error: 'shipping address Deleted.' }, status: :ok
        end
      
        private
      
        def set_shipping_address
          @shipping_address = ShippingAddress.find_by_id(params[:id])
          render json: { error: 'shipping address not found.' }, status: :unprocessable_entity if !@shipping_address.present?
        end
      
        def shipping_address_params
          params.require(:shipping_address).permit(:title, :first_name, :last_name, :address_line_1, :address_line_2, :city, :state, :postal_code, :country, :country_code, :phone_number, :mail, :default)
        end
    end
  end
end
      