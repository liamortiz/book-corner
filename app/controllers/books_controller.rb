class BooksController < ApplicationController

    def index
      @books = GoogleBooks.search("art", {count: 40})
    end

    def show
       @book = Book.find_by(isbn: params[:id])
      unless @book
        @book = GoogleBooks.search(isbn: params[:id]).first
        @book = Book.create(title: @book.title, description: @book.description, authors: @book.authors, published_date: @book.published_date, isbn: @book.isbn, categories: @book.categories, average_rating: @book.average_rating, ratings_count: @book.ratings_count, image_link:@book.image_link)
        @book.create_reviews
      end
    end


end
