module Api
  module V1 
    class PaymentsController < ApplicationController
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
          order.update!(razorpay_order_id: razorpay.id, paid_at: Time.now)
          payment = Payment.create(
            user_id: current_user.id, # Assuming you have authentication and current_user method
            order_id: order.id,
            payment_status: 'pending',
            payment_amount: amount
          )

          render json: { order_id: order.id, razorpay_order_id: razorpay.id }
        else
          render json: { message: "order not found" }
        end   
      end
      
      def capture_payment
        order = Order.find(params[:order_id])
        razorpay_payment_id = params[:razorpay_payment_id]
      
        razorpay_payment = Razorpay::Payment.fetch(razorpay_payment_id)
      
        if razorpay_payment.status == 'captured'
          order.payment.update(payment_status: 'success', razorpay_payment_id: razorpay_payment_id)
          order.user = @current_user
          order.update(status: "Placed") if order.present?
          
          # Create UserCoupon after successful payment capture
          TempUserCoupon.where(user_id: @current_user.id).each do |temp_coupon|
            UserCoupon.create!(user_id: temp_coupon.user_id, coupon_id: temp_coupon.coupon_id)
          end
          TempUserCoupon.where(user_id: @current_user.id).destroy_all
          
          # Create invoice
          create_invoice(order) # Call create_invoice method defined within the same class
          @current_user.cart.destroy if @current_user.cart.present?
                    
          render json: { success: true, message: 'Payment captured successfully' }
        else
          render json: { success: false, message: 'Payment capture failed' }
        end
      end

      private

      def create_invoice(order)
        # Generate invoice number (you may use your own logic here)
        invoice_number = "INV#{Time.now.strftime("%Y%m%d")}-#{SecureRandom.hex(4).upcase}"

        # Create invoice
        invoice = Invoice.create!(
          invoice_number: invoice_number,
          user_id: order.user_id,
          order_id: order.id,
          date: Date.today
        )

        # Create invoice items
        order.order_items.each do |order_item|
          InvoiceItem.create!(
            name: order_item.product.name,
            price: order_item.quantity * order_item.unit_price,
            quantity: order_item.quantity,
            invoice_id: invoice.id
          )
        end
      end
    end
  end
end
