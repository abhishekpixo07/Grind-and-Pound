module Api
    module V1
      class PrivacyPoliciesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
  
        def index
          @privacy_policies = PrivacyPolicy.all
          render json: { status: 'Success', message: 'privacy policies', data: @privacy_policies }, status: :ok
        end
      end
    end
  end
  