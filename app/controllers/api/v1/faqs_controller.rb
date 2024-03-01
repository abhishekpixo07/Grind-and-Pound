module Api
    module V1
      class FaqsController < ApplicationController
        skip_before_action :authenticate_user_from_token!
  
        def index
            @faqs = Faq.all
            render json: @faqs
        end

      end
    end
end
  