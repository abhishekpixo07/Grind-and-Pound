class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user_from_token!
  
    # private
  
    # def authenticate_user_from_token!
    #   token = request.headers['Authorization']
    #   @session = Session.find_by(token: token)
  
    #   if @session
    #     @current_user = @session.user
    #   else
    #     render json: { error: 'Invalid or expired token' }, status: :unauthorized
    #   end
    # end
  
    # def current_user
    #   @current_user
    # end
end
  