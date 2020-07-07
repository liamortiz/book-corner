class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end

    def create
        # byebug
        @review = Review.create(review_params)
        redirect_to book_path(params[:review][:book_id])
    end

    private

    def review_params
        params.require(:review).permit(:user_id,:book_id,:rating, :content)
    end

    
end
