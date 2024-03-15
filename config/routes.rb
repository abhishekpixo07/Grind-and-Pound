# config/routes.rb

Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :admin do
    resources :users do
      member do
        put 'toggle_active'
      end
    end
  end

  authenticate :admin_user do
    delete 'admin/logout', to: 'admin/admin_users#custom_logout', as: 'admin_logout'
  end


  root to: "admin/dashboard#index"
  namespace :api do
    namespace :v1 do
      post 'home', to: 'homes#home'
      resources :users, only: [:create,:update] do
        collection do
          post :confirm_otp
          post :account
          get :profile
          delete :logout  # Adding the logout action
        end
      end

      resources :users do
        resources :orders, only: [:index]
        post 'resend_otp', on: :collection
      end
      resources :orders

      resources :orders, only: [] do
        member do
          get 'show_status'
        end
      end
      
      post '/create/payment', to: 'payments#create_payment'
      post '/capture/payment', to: 'payments#capture_payment'
      
      resources :banners, only: [:index]
      resources :user_subscriptions
      get 'plan/list', to: 'user_subscriptions#plan_list',as: :plan_list
      resources :products, only: [:show] do
        collection do
          post 'index', to: 'products#index'
          post '/check_availability', to: 'products#check_availability'
          get 'check/stock/:id', to: 'products#check_stock',as: :check_stock
          post :available_zip_codes
        end
      end
      resources :shipping_addresses
      resources :carts do
        delete 'reset_cart', on: :collection
      end
      resources :reviews, only: [:show, :create, :update, :destroy] do 
        collection do 
          post 'index', to: 'reviews#index'
        end
      end

      resources :vouchers, only: [:index, :show]
      resources :our_stories, only: [:index, :show] do
        collection do
          get 'about_us', to: 'our_stories#about_us',as: "/about/us"
        end
      end
      resources :stores, only: [:index]
      resources :blogs, only: [:index, :show]
      resources :faqs, only: [:index]
      
      post '/refer_without_login', to: 'referrals#refer_without_login'
      post '/refer_with_login', to: 'referrals#refer_with_login'

      resources :coupons, only: [:index, :show] do
        collection do
          post 'apply'
          delete 'remove'
        end
      end
      # Other API routes...
    end
  end
end
