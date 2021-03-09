require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = Book.select(:id,:title)
        render json: books, status: :ok and return
      end

      def create
        book = Book.new(book_params)
        if book.save
          render json: book, status: :ok and return
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      private
      def book_params
        params.require(:book).permit(:title,:price,:published_at,{categories:[]})
      end
    end
  end
end
