class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
        @review = Review.new
    end
end
