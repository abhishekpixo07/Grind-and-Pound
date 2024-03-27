module Api
    module V1     
        class OrdersController < ApplicationController
            before_action :authenticate_user_from_token!
            before_action :current_user
            before_action :set_order, only: [:show, :update, :destroy, :show_status]

            def show
                render json: { order: OrderSerializer.new(@order), status: :created, message: 'Order retrieved successfully.' }
            end
        

            def index
                @orders = @current_user.orders.includes(:user, :payment).order(created_at: :desc)
                orders_json = @orders.map { |order| OrderSerializer.new(order).as_json }
                render json: { orders: orders_json, status: :listed, message: 'Orders retrieved successfully.' }
            end
               
        
            def create
                if @current_user.cart.blank? || @current_user.cart.cart_items.blank?
                  return render json: { error: 'Cart items not found.' }, status: :unprocessable_entity
                end
              
                @order = Order.new(order_params)
                @shipping_address = ShippingAddress.find_by_id(params[:shipping_address_id])
                copy_shipping_address_details(@order, @shipping_address) if @shipping_address.present?
              
                @store = Store.find_by_id(params[:store_id])
                copy_store_address_details(@order, @store) if @store.present?

                if @order.save
                  set_delivery_date
                  process_order_items
                  render json: { order: OrderSerializer.new(@order), status: :created, message: 'Order created successfully.' }
                else
                  render json: @order.errors, status: :unprocessable_entity
                end
            end
              

            def update
                if @order.update(order_params)
                    render json: { order: OrderSerializer.new(@order), status: :created, message: 'Order updated successfully.' }
                else
                    render json: @order.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @order.destroy
                render json: { message: 'Order deleted successfully.' }
            end

            def show_status 
                @order = @current_user.orders.find_by(id: params[:id])       
                if @order
                  render json: { status: @order.status, order: OrderSerializer.new(@order), message: 'Order status retrieved successfully.' }
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
                params.require(:order).permit(:sub_total, :discount_amount, :grand_total, :shipping_fee, :total_amount, :status, :payment_method, :delivery_method, :notes)
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

            def copy_shipping_address_details(order,shipping_address)
                if shipping_address
                  order.address_line_1 = shipping_address.address_line_1
                  order.address_line_2 = shipping_address.address_line_2
                  order.city = shipping_address.city
                  order.state = shipping_address.state
                  order.postal_code = shipping_address.postal_code
                  order.country = shipping_address.country
                end
            end

            def copy_store_address_details(order,store)
                if store
                    order.address_line_1 = store.address_line_1
                    order.address_line_2 = store.address_line_2
                    order.city = store.city
                    order.state = store.state
                    order.postal_code = store.postal_code
                    order.country = store.country
                end
            end

        end
    end
end
