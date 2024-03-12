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
          coupon = Coupon.find_by(code: coupon_code)
          
          return render_coupon_error({ status: 'Expired', message: 'Sorry, the coupon has expired.' }) if expired_coupon?(coupon)
          
          user_coupon_count = UserCoupon.where(user_id: @current_user.id, coupon_id: coupon.id).count
          return render_coupon_error({ status: 'Redeemed', message: 'This coupon can only be used once per user.' }) if unique_coupon_used?(coupon, user_coupon_count)
        
          if global_usage_limit_reached?(coupon, user_coupon_count)
            return render_coupon_error({ status: 'Redeemed', message: 'Coupon usage limit reached for this user.' })
          end
        
          return render_coupon_error({ status: 'Unused', message: 'Coupon usage limit reached. No more uses available.' }) if coupon.no_of_uses <= 0
        
          coupon.update(no_of_uses: coupon.no_of_uses - 1)
          UserCoupon.create!(user_id: @current_user.id, coupon_id: coupon.id)
          discount_amount = (coupon.discount_percentage / 100) * total_price
          discounted_price = total_price - discount_amount
        
          render json: { status: 'Unused', message: 'Congratulations! The coupon was applied successfully.', success: true, discounted_price: discounted_price, discount_amount: discount_amount }
        end           
        
        private
        
        def remove
          render json: { message: "Coupon removed successfully" }
        end
      
        private
      
        def set_coupon
          @coupon = Coupon.find(params[:id])
        end

        def expired_coupon?(coupon)
          return coupon.expiry_date.present? && coupon.expiry_date < Date.current
        end
        
        def unique_coupon_used?(coupon, user_coupon_count)
          return coupon.unique_per_user && user_coupon_count >= 1
        end
        
        def global_usage_limit_reached?(coupon, user_coupon_count)
          return coupon.no_of_uses > 0 && coupon.user_limit > 0 && user_coupon_count >= coupon.user_limit
        end
        
        def render_coupon_error(message)
          render json: { success: false, message: message }
        end
        
    end
  end
end