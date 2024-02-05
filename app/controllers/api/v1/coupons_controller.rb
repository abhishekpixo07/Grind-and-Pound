# app/controllers/api/v1/coupons_controller.rb

class Api::V1::CouponsController < ApplicationController
    before_action :authenticate_user_from_token!
    before_action :current_users
    before_action :set_coupon, only: [:show, :apply, :remove]
  
    def index
      @coupons = Coupon.all
      render json: @coupons
    end
  
    def show
      render json: @coupon
    end
  
    def apply
      render json: { message: "Coupon applied successfully" }
    end
  
    def remove
      render json: { message: "Coupon removed successfully" }
    end
  
    private
  
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end
  end
  