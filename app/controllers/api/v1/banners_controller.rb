module Api
    module V1   
        class BannersController < ApplicationController
            skip_before_action :authenticate_user_from_token!

            def index
                banners = Banner.all.map do |banner|
                    {
                      id: banner.id,
                      title: banner.title,
                      banner_type: banner.banner_type,
                      text_color: banner.text_color,
                      image_url: url_for(banner.attachment.url),
                    }
                  end
                render json: { banners: banners }
            end
        end
    end
end
