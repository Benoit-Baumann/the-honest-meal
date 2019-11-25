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
    @review.save
    if @review.save
      ReviewMailer.with(review: @review).send_link.deliver_now
      redirect_to profile_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find_by(token: params[:id])
    render :review_expired, locals: { review: @review }  if (8.days.from_now - @review.created_at.to_time)/1.day > 7
  end

  private

  def review_params
    params.require(:review).permit(:user, :restaurant_id, :username, :content_title,:content, :rating)
  end
end
