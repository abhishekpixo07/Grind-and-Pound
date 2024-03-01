# app/controllers/api/v1/vouchers_controller.rb

module Api
    module V1
      class VouchersController < ApplicationController
        skip_before_action :authenticate_user_from_token!
        before_action :set_voucher, only: [:show]
  
        def index
          @vouchers = Voucher.all
          render json: @vouchers
        end
  
        def show
          render json: @voucher
        end
  
        private
  
        def set_voucher
          @voucher = Voucher.find_by_id(params[:id])
          render json: { error: 'voucher not found.' }, status: :unprocessable_entity if !@voucher.present?
        end
      end
    end
  end
  