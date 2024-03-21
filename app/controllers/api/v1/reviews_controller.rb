module Api
  module V1
    class ReviewsController < ApplicationController
      before_action :authenticate_user_from_token!
      before_action :current_user
      before_action :set_product, only: [:index,:create]
      before_action :set_review, only: [:show, :update, :destroy]

      def index
        @reviews = @product.reviews.order(created_at: :desc)
        render json: @reviews, each_serializer: Api::V1::ReviewSerializer, status: :ok
      end

      def show
        render json: @review, serializer: Api::V1::ReviewSerializer, status: :ok
      end

      def create
        @review = @current_user.reviews.new(review_params)
        if @review.save
          render json: @review, serializer: Api::V1::ReviewSerializer, status: :created, location: api_v1_review_url(@review)
        else
          render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @review.update(review_params)
          render json: @review, serializer: Api::V1::ReviewSerializer
        else
          render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @review.destroy
        render json: { error: 'review Deleted.' }, status: :ok
      end

      private

      def set_product
        @product = Product.find_by_id(params[:product_id])
        render json: { error: 'product not found.' }, status: :unprocessable_entity if !@product.present?
      end

      def set_review
        @review = Review.find_by_id(params[:id])
        render json: { error: 'review not found.' }, status: :unprocessable_entity if !@review.present?
      end

      def review_params
        params.require(:review).permit(:product_id, :content, :rating)
      end
    end
  end
end
