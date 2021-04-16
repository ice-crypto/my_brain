require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]
      def index
        root_categories = Category.where(root:true).select(:id,:title)
        render json: root_categories, status: :created and return
      end

      def show
        if Category.find_by(id: params[:id]).nil?
          render status: :unprocessable_entity and return
        else
          render json: Category.relation_to_json(params[:id]), status: :ok and return
        end
      end

      def create
        if Category.json_to_relation(params[:category][:data].as_json)[0].kind_of?(Integer)
          render status: :created and return
        else
          render status: :unprocessable_entity
        end
      end

      def update_recursive
        if Category.json_to_relation_update(params[:category][:data].as_json)[0].kind_of?(Integer)
          render status: :created and return
        else
          render status: :unprocessable_entity
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
        category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
