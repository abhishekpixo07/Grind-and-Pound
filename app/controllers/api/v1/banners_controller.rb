module Api
    module V1   
        class BannersController < ApplicationController
            skip_before_action :authenticate_user_from_token!

            def index
                banners = Banner.all.map do |banner|
                    {
                      id: banner.id,
                      image_url: url_for(banner.attachment),
                    }
                  end
                render json: { banners: banners }
            end
        end
    end
end
