module Api
    module V1
      class BlogsController < ApplicationController
        skip_before_action :authenticate_user_from_token!
        before_action :set_blog, only: [:show]
  
        def index
          @blogs = Blog.all
          render json: @blogs
        end
  
        def show
          render json: @blog
        end
  
        private
  
        def set_blog
          @blog = Blog.find_by_id(params[:id])
          render json: { error: 'Blog not found.' }, status: :unprocessable_entity if !@blog.present?
        end
      end
    end
  end
  