# config/routes.rb

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create,:update] do
        collection do
          post :confirm_otp
          get :profile
          delete :logout  # Adding the logout action
        end
      end

      resources :products, only: [:index, :show]
      
      # Other API routes...
    end
  end
end
