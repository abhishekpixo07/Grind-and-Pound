module Api
  module V1 
    class Api::V1::CouponsController < ApplicationController
        before_action :authenticate_user_from_token!
        before_action :current_user
        before_action :set_coupon, only: [:show]
      
        def index
          @coupons = Coupon.all.map do |coupon|
            {
              id: coupon.id,
              code: coupon.code,
              title: coupon.title,
              description: coupon.description,
              discount_percentage: coupon.discount_percentage,
              status: coupon_status(coupon),
              created_at: coupon.created_at,
              updated_at: coupon.updated_at
            }
          end
          render json: @coupons
        end
      
        def show
          render json: @coupon
        end
      
        
        def apply
          total_price = params[:total_price].to_f
          coupon_code = params[:coupon_code]
          
          coupon = Coupon.find_by(code: coupon_code)
          if coupon.present?
            temp_user_coupon_count = TempUserCoupon.where(user_id: @current_user.id, coupon_id: coupon.id).count
            return render_coupon_error({ status: 'Expired', message: 'Sorry, the coupon has expired.' }) if expired_coupon?(coupon)
            return render_coupon_error({ status: 'Redeemed', message: 'This coupon can only be used once per user.' }) if unique_coupon_used?(coupon, temp_user_coupon_count)
            if global_usage_limit_reached?(coupon, temp_user_coupon_count)
              return render_coupon_error({ status: 'Redeemed', message: 'Coupon usage limit reached for this user.' })
            end
            return render_coupon_error({ status: 'Unused', message: 'Coupon usage limit reached. No more uses available.' }) if coupon.no_of_uses <= 0

            coupon_status = coupon_status(coupon)
            return render_coupon_error({ status: coupon_status, message: 'Sorry, the coupon cannot be applied.' }) if coupon_status != 'Unused'
            
            coupon.update(no_of_uses: coupon.no_of_uses - 1)
            TempUserCoupon.create!(user_id: @current_user.id, coupon_id: coupon.id)
            discount_amount = (coupon.discount_percentage / 100) * total_price
            discounted_price = total_price - discount_amount
            
            render json: { status: 'Unused', message: 'Congratulations! The coupon was applied successfully.', success: true, discounted_price: discounted_price, discount_amount: discount_amount, discount_percentage: coupon.discount_percentage }
          else
            render json: { error: 'Coupon not found.' }, status: :unprocessable_entity
          end
        end

        def remove
          coupon_code = params[:coupon_code]  
          coupon = Coupon.find_by(code: coupon_code)
          # If the coupon exists, remove it from TempUserCoupon
          if coupon.present?
            temp_coupon = TempUserCoupon.find_by(user_id: @current_user.id, coupon_id: coupon.id)     
            if temp_coupon.present?
              temp_coupon.destroy
              # Increment the number of uses when removing the coupon
              coupon.update(no_of_uses: coupon.no_of_uses + 1)
              render json: { success: true, message: 'Coupon removed successfully' }
            else
              render json: { success: false, message: 'Coupon not found in applied coupons' }, status: :unprocessable_entity
            end
          else
            render json: { error: 'Coupon not found' }, status: :unprocessable_entity
          end
        end     
              
        private
      
        def set_coupon
          @coupon = Coupon.find_by_id(params[:id])
          render json: { error: 'coupon not found.' }, status: :unprocessable_entity if !@coupon.present?
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

        def coupon_status(coupon)
          user_coupon_count = TempUserCoupon.where(user_id: @current_user.id, coupon_id: coupon.id).count
          return 'Expired' if expired_coupon?(coupon)
          return 'Redeemed' if unique_coupon_used?(coupon, user_coupon_count)
          return 'Redeemed' if global_usage_limit_reached?(coupon, user_coupon_count)
          return 'Unused' if coupon.no_of_uses > 0 || user_coupon_count < coupon.user_limit
  
          'Coupon usage limit reached'
        end
        
    end
  end
end