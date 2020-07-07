class BooksController < ApplicationController

    def index
      @books = GoogleBooks.search("art", {count: 40})
    end

    def show
        @book = Book.find(params[:id])
        @review = Review.new
    end
end
