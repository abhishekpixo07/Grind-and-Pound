# app/controllers/api/v1/user_subscriptions_controller.rb
module Api
    module V1
      class UserSubscriptionsController < ApplicationController
        before_action :authenticate_user_from_token!, except: [:plan_list]
        before_action :current_user, except: [:plan_list]
        before_action :set_user_subscription, only: [:show, :update, :destroy]

        def plan_list
          if request.headers['Authorization'].present?
            authenticate_user_from_token! # Authenticate the user if token is present
          end
          plans = Plan.all
          if @current_user.present?
            active_plan_id = @current_user.subscription&.plan_id
            plans_json = plans.as_json(only: [:id, :name, :price, :features])
            plans_json.each do |plan|
              plan['is_subscription'] = plan['id'] == active_plan_id
            end
            render json: plans_json
          else
            render json: plans.as_json(only: [:id, :name, :price, :features])
          end
        end              
  
        def index
          @subscription = @current_user.subscription
          if @subscription.present?
            render json: @subscription, status: :ok
          else
            render json: { error: 'User subscription not found.' }, status: :unprocessable_entity
          end
        end
  
        def show
          render json: @user_subscription, serializer: Api::V1::SubscriptionSerializer
        end
  
        def create
          if @current_user.subscription.present?
            return render json: { error: 'User already has an active subscription' }, status: :unprocessable_entity
          end

          razorpay_payment_id = params.dig(:user_subscription, :razorpay_payment_id)
          return render json: { error: 'Payment not found' }, status: :unprocessable_entity unless razorpay_payment_id.present?
        
          razorpay_payment = Razorpay::Payment.fetch(razorpay_payment_id)
          return render json: { error: 'Payment not captured' }, status: :unprocessable_entity unless razorpay_payment.status == 'captured'
        
          @user_subscription = Subscription.new(user_subscription_params)
          @user_subscription.user = @current_user
        
          if @user_subscription.save
            payment_params = {
              user_id: @current_user.id,
              subscription_id: @user_subscription.id,
              payment_status: 'success',
              payment_amount: razorpay_payment.amount,
              razorpay_payment_id: razorpay_payment_id
            }
            @payment = Payment.create(payment_params)
            render json: { subscription: @user_subscription, payment: @payment }, status: :created
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
          @user_subscription = @current_user.subscription.find_by_id(params[:id])
          render json: { error: 'user subscription not found.' }, status: :unprocessable_entity if !@user_subscription.present?
        end
  
        def user_subscription_params
          params.require(:user_subscription).permit(:plan_id, :status) # Add other permitted parameters
        end
      end
    end
  end
  