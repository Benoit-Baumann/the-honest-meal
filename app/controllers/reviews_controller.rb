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
    render :invalid_review if @review.nil?
    render :expired_review, locals: { review: @review } if (Time.now - @review.created_at.to_time)/1.day > 7
    if @review.restaurant.owner.question_pools.empty?
      @questions = nil
    else
      @questions = QuestionPool.find(user_id: @review.restaurant.owner).questions
    end
  end
  
  def update
    # @review = Review.find(params[review])
    @review.user = current_user
    # save answers to DB
  end

  private

  def review_params
    params.require(:review).permit(:user, :restaurant_id, :username, :content_title,:content, :rating)
  end
end
