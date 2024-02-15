# app/controllers/api/v1/user_subscriptions_controller.rb
module Api
    module V1
      class UserSubscriptionsController < ApplicationController
        before_action :authenticate_user_from_token!
        before_action :current_user
        before_action :set_user_subscription, only: [:show, :update, :destroy]
  
        def index
          @subscriptions = @current_user.subscriptions
          if @subscriptions.present?
            render json: @subscriptions, status: :ok
          else
            render json: { error: 'User subscriptions not found.' }, status: :unprocessable_entity
          end
        end
  
        def show
          render json: @user_subscription, serializer: Api::V1::SubscriptionSerializer
        end
  
        def create
          @user_subscription = @current_user.subscriptions.build(user_subscription_params)
  
          if @user_subscription.save
            render json: @user_subscription, serializer: Api::V1::SubscriptionSerializer, status: :created
          else
            render json: { errors: @user_subscription.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def update
          puts "Params: #{params.inspect}"
          status_mapping = { "active" =>  0, "cancelled" =>  1, "suspended" =>  2 }
          if status_mapping.key?(params[:status])
            @user_subscription.assign_attributes(status: status_mapping[params[:status]])
          end

          if @user_subscription.update(user_subscription_params)
            render json: @user_subscription, serializer: Api::V1::SubscriptionSerializer
          else
            render json: { errors: @user_subscription.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def destroy
          @user_subscription.destroy
          render json: { error: 'user subscription deleted.' }, status: :ok
        end
  
        private
  
        def set_user_subscription
          @user_subscription = @current_user.subscriptions.find_by_id(params[:id])
          render json: { error: 'user subscription not found.' }, status: :unprocessable_entity if !@user_subscription.present?
        end
  
        def user_subscription_params
          params.require(:user_subscription).permit(:plan_id, :status) # Add other permitted parameters
        end
      end
    end
  end
  