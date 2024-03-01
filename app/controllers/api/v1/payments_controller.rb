module Api
    module V1 
      class Api::V1::PaymentsController < ApplicationController
        before_action :authenticate_user_from_token!
        before_action :current_user


        def create_payment
            order_id = params[:order_id]
            order = Order.find_by_id(order_id)
            if order.present?
                amount = order.total_amount.to_i # Adjust this based on your order amount logic
                razorpay = Razorpay::Order.create(
                    amount: amount * 100,
                    currency: 'INR',
                    receipt: SecureRandom.hex(10),
                    payment_capture: 1,
                )
        
                payment = Payment.create(
                user_id: current_user.id, # Assuming you have authentication and current_user method
                order_id: order.id,
                payment_status: 'pending',
                payment_amount: amount
                )
        
                render json: { order_id: order.id, razorpay_order_id: razorpay.id}
            else
                render json: { message: "order not found" }
            end   
        end
      
        def capture_payment
            payment = Payment.find(params[:payment_id])
            razorpay_payment_id = params[:razorpay_payment_id]
      
            razorpay_payment = Razorpay::Payment.fetch(razorpay_payment_id)
      
            if razorpay_payment.status == 'captured'
              payment.update(payment_status: 'success')
              render json: { success: true, message: 'Payment captured successfully' }
            else
              render json: { success: false, message: 'Payment capture failed' }
            end
          end
        end
    end
end