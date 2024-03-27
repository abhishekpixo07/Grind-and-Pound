module Api
    module V1
      class TermsOfUsesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
  
        def index
          @term_of_uses = TermOfUse.all
          render json: { status: 'Success', message: 'Terms Of Uses', data: @term_of_uses }, status: :ok
        end
      end
    end
end
  