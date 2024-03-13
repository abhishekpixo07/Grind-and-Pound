module Api
  module V1
    class UsersController < ApplicationController
      require 'open-uri'
      include OtpAuthenticable
      before_action :authenticate_user_with_otp, only: [:create]
      before_action :authenticate_user_from_token!, only: [:logout, :profile, :update]
      before_action :current_user, only: [:profile, :update]
      before_action :find_user, only: [:confirm_otp, :account]

      def create
        # The logic is now handled in the OtpAuthenticable concern
      end

      def confirm_otp
        if @user.phone_number == params[:phone_number] && "0000" == params[:otp]
          @user.update(otp:nil,active: true)
          # Additional logic if needed after OTP confirmation
          if @user.phone_number.present? && @user.first_name.present? && @user.email.present? 
            @user_token = create_session(@user)
            render json: { message: 'OTP confirmed successfully.', authorization: @user_token&.token }, status: :ok 
          else
            render json: { message: 'OTP confirmed successfully.' }, status: :ok 
          end
        else
          render json: { errors: ['Invalid OTP or phone number.'], Authorization: @user_token }, status: :unprocessable_entity
        end
      end  

      def account
        handle_attachment(@user) if params[:user][:attachment].present?
        if User.exists?(email: user_params[:email])
          render json: { errors: ["Email is already taken"] }, status: :unprocessable_entity
        else
          if @user.update(user_params.except(:attachment))
            @user_token = create_session(@user)
            render json: { message: 'User created successfully.', user: ActiveModel::SerializableResource.new(@user, serializer: Api::V1::UserSerializer), authorization: @user_token&.token }, status: :ok
          else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end
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
        handle_attachment(@current_user) if params[:user][:attachment].present?
        if User.exists?(email: user_params[:email]) && user_params[:email] != @current_user.email
          render json: { errors: ["Email is already taken"] }, status: :unprocessable_entity
        else
          if @current_user.update(user_params.except(:attachment))
            render json: @current_user, serializer: Api::V1::UserSerializer, status: :ok
          else
            render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end

      def resend_otp
        authenticate_user_with_otp
      end
      # Other API actions...

      private

      def handle_attachment(user)
        user.attachment.purge if user.attachment.attached?
        result = Cloudinary::Uploader.upload(params[:user][:attachment].tempfile)
        user.attachment.attach(io: URI.open(result['secure_url']), filename: 'attachment_file')
        user.attachment.save
      end

      def user_params
        params.require(:user).permit(:country_code, :phone_number, :title, :first_name, :last_name, :email, :otp, :active, :dob, :doa, :address, :pin_code, :district, :state, :country, :gender, :acceptance, :attachment)
      end

      def find_user
        @user = User.find_by_phone_number(params[:user][:phone_number])
        render json: { error: 'user not found.' }, status: :unprocessable_entity if !@user.present?
      end

    end
  end
end

