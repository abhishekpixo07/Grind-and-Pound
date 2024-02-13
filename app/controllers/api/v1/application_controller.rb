# app/controllers/api/v1/application_controller.rb
module Api
    module V1
      class ApplicationController < ActionController::API
        before_action :authenticate_user_from_token!
    
        private
    
        def authenticate_user_from_token!
          token = request.headers['Authorization']
          @session = Session.find_by(token: token)
    
          if @session
            @current_user = @session.user
          else
            render json: { error: 'Invalid or expired token' }, status: :unauthorized
          end
        end
    
        def current_user
          @current_user
        end

        def set_active_storage_url_options
          ActiveStorage::Current.url_options = {
            host: request.base_url
            # Add any other options you need, such as protocol, port, etc.
          }
        end
        
      end
    end
  end
  