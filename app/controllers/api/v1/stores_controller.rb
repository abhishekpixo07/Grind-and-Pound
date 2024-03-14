# app/controllers/api/v1/stores_controller.rb
module Api
    module V1
      class StoresController < ApplicationController
        skip_before_action :authenticate_user_from_token!
        def index
          @stores = Store.all
          render json: { status: 'Success', message: 'Store details', data: @stores }, status: :ok
        end
      end
    end
  end
  