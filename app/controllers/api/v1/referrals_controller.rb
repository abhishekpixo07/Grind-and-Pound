# app/controllers/api/v1/referrals_controller.rb
module Api
  module V1
    class ReferralsController < ApplicationController
      before_action :authenticate_user_from_token!
      before_action :current_user

      def share_referral_code
        referr = @current_user # Assuming you have a way to get the current user
    
        if referr.referral_key.present?
          email = params[:email]
    
          if email.present?
            # Check if the email is valid
            if email =~ URI::MailTo::EMAIL_REGEXP
              ReferralMailer.refer_email(email, referr.referral_key).deliver_now
              render json: { message: "Referral email sent to #{email}" }
            else
              render json: { error: 'Invalid email format' }, status: :unprocessable_entity
            end
          else
            render json: { error: 'Email is required' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Referrer does not have a referral code' }, status: :unprocessable_entity
        end
      end

      def user_referral_code
        email = params[:email]
        referred_user = User.find_by(email: email)
      
        if referred_user
          referral_key = generate_referral_key
          begin
            current_user.referred_users << referred_user
            referred_user.update!(referral_key: referral_key)
            ReferralMailer.refer_accepted_email(current_user, referred_user).deliver_now
            render json: { message: "User referred successfully", referral_key: referral_key }
          rescue ActiveRecord::RecordInvalid => e
            render json: { error: e.record.errors.full_messages.to_sentence }, status: :unprocessable_entity
          end
        else
          render json: { error: 'User with the provided email not found' }, status: :not_found
        end
      end
      
      private
    
      def generate_referral_key
        random_number = rand(1000..9999)
        "GRIND#{random_number}"
      end
    end
  end
end
