# app/controllers/api/v1/our_stories_controller.rb

module Api
    module V1
      class OurStoriesController < ApplicationController
        skip_before_action :authenticate_user_from_token!
        before_action :set_our_story, only: [:show]
  
        def index
          @our_stories = OurStory.all
          render json: @our_stories
        end
  
        def show
          render json: @our_story
        end
  
        private
  
        def set_our_story
          @our_story = OurStory.find_by_id(params[:id])
          render json: { error: 'our story not found.' }, status: :unprocessable_entity if !@our_story.present?
        end
      end
    end
  end
  