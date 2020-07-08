class BooksController < ApplicationController
    # TODO: Fix weird browse page bug swapping book ISBNS
    # TODO: Make code more efficient
    def index
      # Filter the search results from the API via page index and query
      @books = GoogleBooks.search(self.query, {count: 40,
        page: params[:page] ? params[:page].to_i : 1})
      # Remove any that doesn't have ISBNS
      @books = @books.select{|book| book.isbn}
    end

    def show
      # If the book is in the databse do nothing
      # Else add the book to the databse
      @book = Book.find_by(isbn: params[:isbn])
      unless @book
        @book = GoogleBooks.search(isbn: params[:isbn]).first
        @book = Book.create(title: @book.title, description: @book.description, authors: @book.authors,
          published_date: @book.published_date, isbn: @book.isbn, categories: @book.categories,
          average_rating: @book.average_rating, ratings_count: @book.ratings_count, image_link: @book.image_link)

        @book.create_reviews
      end
    end

    def search
      redirect_to "/books/?q=#{self.query}&page=1"
    end

    def query
      (params[:q] ? params[:q] : 'anime')
    end
end
