module Api
  module V1
    class OurStoriesController < ApplicationController
      skip_before_action :authenticate_user_from_token!
      before_action :set_our_story, only: [:show]

      def index
        @our_stories = OurStory.all
        render json: { status: 'Success', message: 'All our stories', data: @our_stories }, status: :ok
      end

      def show
        render json: { status: 'Success', message: 'Our story details', data: @our_story }, status: :ok
      end

      def about_us
        @about_us = AboutUs.all.order(created_at: :desc)
        render json: { status: 'Success', message: 'About us', data: @about_us }, status: :ok
      end

      private

      def set_our_story
        @our_story = OurStory.find_by_id(params[:id])
        if @our_story.present?
          return @our_story
        else
          render json: { status: 'Error', message: 'Our story not found.' }, status: :unprocessable_entity
        end
      end
    end
  end
end
