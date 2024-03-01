module Api
    module V1     
        class OrdersController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_order, only: [:show, :update, :destroy]

            def show
                render json: @order
            end

            def index
                @orders = @current_user.orders
                render json: @orders
            end

            def create
                @order = Order.new(order_params)
                @order.user = @current_user
                if @order.save
                render json: @order, status: :created
                else
                render json: @order.errors, status: :unprocessable_entity
                end
            end

            def update
                if @order.update(order_params)
                render json: @order
                else
                render json: @order.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @order.destroy
                render json: { message: 'Order deleted successfully.' }
            end

            private

            def set_order
                @order = Order.find_by_id(params[:id])
                render json: { error: 'order not found.' }, status: :unprocessable_entity if !@order.present?
            end

            def order_params
                params.require(:order).permit(:shipping_address_id, :total_amount, :status, :payment_method, :notes)
            end
        end
    end
end
