class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @reviews = current_user.reviews
  end

  def new
    @review = Review.new
    @answer = Answer.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save!
  #   if @review.save
  #     redirect_to profile_path
  #   else
  #     render :new
  #   end
  end

  private

  def review_params
    params.require(:review).permit(:user, :restaurant_id, :username, :content_title,:content, :rating)
  end
end
