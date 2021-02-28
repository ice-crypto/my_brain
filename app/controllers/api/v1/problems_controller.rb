require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class ProblemsController < ApplicationController
      before_action :set_problem, only: [:show, :update, :destroy]
      def index
        problems = Problem.all.order(id:'desc')
        render json: problems, status: :ok and return
      end

      def questions
        questions = Problem.of_questioin_select
        render json: questions, status: :ok and return
      end
      def create
        problem = Problem.new(problem_params)

        if problem.save!
          render json: problem, status: :created and return
        else
          render json: problem.errors, status: :unprocessable_entity
        end
      end

      def update
        if problem.update(problem_params)
          render json: problem, status: :created and return
        else
          render json: problem.errors, status: :unprocessable_entity
        end
      end

      private

      def set_problem
        problem = Problem.find(params[:id])
      end

      def problem_params
        params.require(:problem).permit(:body,:question_at,:period_id,:format_id,{categories:[]})
      end
    end
  end
end
