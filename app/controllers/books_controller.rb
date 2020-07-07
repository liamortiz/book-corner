class BooksController < ApplicationController

    def index
      @books = GoogleBooks.search("art", {count: 40})
    end

    def show
      @book = Book.find_by(id: params[:id])
      unless @book
        @book = GoogleBooks.search(isbn: params[:id]).first
      end
    end
end
