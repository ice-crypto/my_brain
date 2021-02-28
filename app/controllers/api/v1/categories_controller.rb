require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]
      def index
        categories = Category.all
        render json: categories, status: :created and return
      end

      def create
        category = Category.new(category_params)

        if category.save
          render json: category, status: :created and return
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end

      def update
        if category.update(category_params)
          render json: category and return
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end

      private

      def set_category
        problem = Problem.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end