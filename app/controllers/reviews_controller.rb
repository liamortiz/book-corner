class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def create
      @review = Review.create(review_params)
      @review.book.update_rating_average

      redirect_to book_path(@review.book.isbn)
    end

    def edit
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)

        redirect_to user_path(@review.user_id)
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to user_path(@review.user_id)
    end

    private

    def review_params
        params.require(:review).permit(:user_id,:book_id,:rating, :content)
    end


end
