module Api
  module V1
    class UsersController < ApplicationController
      include OtpAuthenticable
      before_action :authenticate_user_with_otp, only: [:create]
      before_action :authenticate_user_from_token!, only: [:confirm_otp, :logout, :profile, :update]
      before_action :current_user, only: [:profile, :update]
      before_action :set_active_storage_url_options

      def create
        # The logic is now handled in the OtpAuthenticable concern
      end

      def confirm_otp
        if @current_user.phone_number == params[:phone_number] && "0000" == params[:otp]
          @current_user.update(otp:nil,active: true)
          # Additional logic if needed after OTP confirmation
          render json: { message: 'OTP confirmed successfully.' }, status: :ok
        else
          render json: { errors: ['Invalid OTP or phone number.'], Authorization: @user_token }, status: :unprocessable_entity
        end
      end
      

      def logout        
        if @session.present?
          @session.destroy
          render json: { message: 'Logout successful.' }, status: :ok
        else
          render json: { errors: ['Invalid session.'], Authorization: @user_token }, status: :unprocessable_entity
        end
      end

      def profile
        if @current_user
          render json: @current_user, serializer: Api::V1::UserSerializer, status: :ok
        else
          render json: { error: 'User not found or invalid authorization token.' }, status: :unprocessable_entity
        end
      end
 
      def update
        if params[:user][:attachment].present?
          @current_user.attachment.purge # Remove the existing attachment if needed
          @current_user.attachment.attach(params[:user][:attachment])
        end
        if @current_user.update(user_params)
          render json: @current_user, serializer: Api::V1::UserSerializer, status: :ok
        else
          render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
        end
      end
      # Other API actions...

      private

      def user_params
        params.require(:user).permit(:country_code, :phone_number, :name, :email, :otp, :active, :dob, :address, :state, :country, :gender, :attachment )
      end

    end
  end
end

