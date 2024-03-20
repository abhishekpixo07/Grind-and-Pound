module Api
    module V1
      class TermsOfSalesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
  
        def index
          @term_of_sales = TermsOfSale.all
          render json: { status: 'Success', message: 'Terms Of Sales', data: @term_of_sales }, status: :ok
        end
      end
    end
  end
  