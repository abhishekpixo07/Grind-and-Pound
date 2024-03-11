module Api
    module V1     
        class OrdersController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_order, only: [:show, :update, :destroy]

            def show
                render json: @order, include: [:user, :shipping_address, :payment]
            end
        

            def index
                @orders = @current_user.orders.includes(:user, :shipping_address, :payment)
                render json: @orders
            end
        
            def create
                if @cart_items.present?
                    @order = Order.new(order_params)
                    @order.user = @current_user
                    if @order.save
                        @order.update(status: "Placed")  if @order.present?
                        @cart_items = @current_user.cart.cart_items if @current_user.cart.present?
                    
                            @cart_items.each do |cart_item|
                            product = cart_item.product
                            quantity = cart_item.quantity
                    
                            @order.order_items.create(
                                product: product,
                                quantity: quantity,
                                unit_price: product.master_price, # Adjust as needed
                                total_price: quantity * product.master_price
                            )
                            end
                        render json: @order, status: :created, include: [:user, :shipping_address, :payment]
                    else
                        render json: @order.errors, status: :unprocessable_entity
                    end
                else
                    render json: { error: 'cart items not found.' }, status: :unprocessable_entity
                end
            end

            def update
                if @order.update(order_params)
                    render json: @order, status: :updated, include: [:user, :shipping_address, :payment]
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
                params.require(:order).permit(:shipping_address_id, :sub_total, :discount_amount, :grand_total, :shipping_fee, :total_amount, :status, :payment_method, :delivery_method, :notes)
            end
        end
    end
end
