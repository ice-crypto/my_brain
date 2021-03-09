require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class FormatsController < ApplicationController
      def index
        formats = Format.select(:id,:problem_type)
        render json: formats, status: :ok and return
      end
    end
  end
end
