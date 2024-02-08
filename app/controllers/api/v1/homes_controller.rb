module Api
    module V1    
        class HomesController < ApplicationController
            def home
                if params[:keyword].present?
                    @products = Product.where('name ILIKE ?', "%#{params[:keyword]}%")
                elsif params[:subcategory_name].present?
                    subcategory = Subcategory.find_by(name: params[:subcategory_name])
                    @products = @products.where(subcategory: subcategory) if subcategory
                else
                    @products = Product.all
                end 
                @subcategories = Subcategory.all
                render json: { data: 'products list.', products: @products.as_json(except: [:created_at, :updated_at]), subcategory: @subcategories.as_json(except: [:created_at, :updated_at]) }, status: :ok
            end
        end
    end
end    
