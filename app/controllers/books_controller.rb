class BooksController < ApplicationController

    def index
      @books = GoogleBooks.search(self.query, {count: 40})
    end

    def show
       @book = Book.find_by(isbn: params[:isbn])

      unless @book
        @book = GoogleBooks.search(isbn: params[:isbn]).first
        @book = Book.create(title: @book.title, description: @book.description, authors: @book.authors,
          published_date: @book.published_date, isbn: @book.isbn, categories: @book.categories,
          average_rating: @book.average_rating, ratings_count: @book.ratings_count, image_link:@book.image_link)

        @book.create_reviews
      end
    end

    def search
      redirect_to "/books/?q=#{self.query}"
    end

    def query
      if params[:q]
        return params[:q]
      else
        'anime'
      end
    end
end
