class ReviewsController < ApplicationController

    def index
        @reviews = current_user.reviews
    end

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.user = current_user
        if @review.save
            redirect_to profile_path
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:user, :restaurant, :username, :content, :rating)
    end
end
