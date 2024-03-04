module Api
  module V1
    class FaqsController < ApplicationController
      skip_before_action :authenticate_user_from_token!

      def index
        @faq_categories = FaqCategory.includes(:faqs).all
        faq_categories_json = @faq_categories.map do |faq_category|
          {
            id: faq_category.id,
            title: faq_category.title,
            faqs: faq_category.faqs.map do |faq|
              {
                id: faq.id,
                question: faq.question,
                answer: faq.answer
              }
            end
          }
        end
        render json: faq_categories_json
      end
    end
  end
end
