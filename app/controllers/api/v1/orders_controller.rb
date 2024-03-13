module Api
    module V1     
        class OrdersController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_order, only: [:show, :update, :destroy, :show_status]

            def show
                render json: @order, include: [:user, :shipping_address, :payment]
            end
        

            def index
                @orders = @current_user.orders.includes(:user, :shipping_address, :payment).order(created_at: :desc)
                render json: @orders
            end
        
            def create
                if @current_user.cart.present? && @current_user.cart.cart_items.present?
                    @order = Order.new(order_params)
                    @order.user = @current_user
                    if @order.save
                        set_delivery_date
                        process_order_items
                        @order.update(status: "Placed")  if @order.present?
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

            def show_status        
                if @order
                  render json: { status: @order.status, message: 'Order status retrieved successfully.' }
                else
                  render json: { status: 'No Orders Found', message: 'There are no orders in the system.' }, status: :not_found
                end
            end

            private

            def set_order
                @order = Order.find_by_id(params[:id])
                render json: { error: 'order not found.' }, status: :unprocessable_entity if !@order.present?
            end

            def order_params
                params.require(:order).permit(:shipping_address_id, :sub_total, :discount_amount, :grand_total, :shipping_fee, :total_amount, :status, :payment_method, :delivery_method, :notes)
            end
            
            def set_delivery_date
                @order.delivery_date = @order.created_at.hour < 12 ? @order.created_at.end_of_day : (@order.created_at + 1.day).end_of_day
            end       

            def process_order_items
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
            end
        end
    end
end
