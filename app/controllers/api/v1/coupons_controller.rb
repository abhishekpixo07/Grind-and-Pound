module Api
  module V1 
    class Api::V1::CouponsController < ApplicationController
        before_action :authenticate_user_from_token!
        before_action :current_user
        before_action :set_coupon, only: [:show, :apply, :remove]
      
        def index
          @coupons = Coupon.all
          render json: @coupons
        end
      
        def show
          render json: @coupon
        end
      
        def apply
          total_price = params[:total_price].to_f
          coupon_code = params[:coupon_code]
          user_id = params[:user_id] # Assuming you're passing the user's ID
         
          coupon = Coupon.find_by(code: coupon_code)
         
          if coupon && coupon.active? && coupon.applicable?(total_price)
             if coupon.expiry_date.present? && coupon.expiry_date < Date.current
               return render json: { success: false, message: 'Coupon has expired' }
             end
         
             if coupon.unique_per_user && coupon.user_limit > 0
               user_coupon_count = UserCoupon.where(user_id: user_id, coupon_id: coupon.id).count
               if user_coupon_count >= coupon.user_limit
                 return render json: { success: false, message: 'Coupon usage limit reached for this user' }
               end
             end
         
             if coupon.no_of_uses > 0 && coupon.no_of_uses <= 0
               return render json: { success: false, message: 'Coupon usage limit reached' }
             end
         
             discount_amount = (coupon.discount_percentage / 100) * total_price
             discounted_price = total_price - discount_amount
         
             UserCoupon.create(user_id: user_id, coupon_id: coupon.id) if coupon.unique_per_user
         
             coupon.update(no_of_uses: coupon.no_of_uses - 1)
             
             render json: { message: "Coupon applied successfully", success: true, discounted_price: discounted_price, discount_amount: discount_amount }
          else
             render json: { success: false, message: 'Invalid or inactive coupon' }
          end
        end 
      
        def remove
          render json: { message: "Coupon removed successfully" }
        end
      
        private
      
        def set_coupon
          @coupon = Coupon.find(params[:id])
        end
    end
  end
end