# config/routes.rb

Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

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
          get :profile
          delete :logout  # Adding the logout action
        end
      end

      resources :users do
        resources :orders, only: [:index]
      end
      resources :orders

      resources :products, only: [:index, :show]
      resources :shipping_addresses
      resources :carts
      resources :reviews, only: [:index, :show, :create, :update, :destroy]
      resources :coupons, only: [:index, :show] do
        member do
          post 'apply'
          delete 'remove'
        end
      end
      # Other API routes...
    end
  end
end
