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
          if coupon && coupon.active? && coupon.applicable?(total_price)
            discount_amount = (coupon.discount_percentage / 100) * total_price
            discounted_price = total_price - discount_amount
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