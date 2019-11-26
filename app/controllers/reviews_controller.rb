class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @reviews = current_user.reviews
  end

  def new
  end
  
  def create
    @email = params[:email]
    render :new unless valid_email(@email)
    @restaurant = Restaurant.find(params[:restaurant])
    @review = Review.new(restaurant: @restaurant)
    if @review.save
      ReviewMailer.with(review: @review, email: @email).send_link.deliver_now
    else
      render :new
    end
  end
  
  def edit
    @review = Review.find_by(token: params[:id])
    if @review.nil?
      render :invalid_review
    elsif (Time.now - @review.created_at.to_time)/1.day > 7
      render :expired_review, locals: { review: @review } 
    else
      if @review.restaurant.owner.question_pools.empty?
        @questions = nil
      else
        @questions = QuestionPool.find(user_id: @review.restaurant.owner).questions
      end
    end
  end
  
  def update
    # @review = Review.find(params[review])
    @review.user = current_user
    # save answers to DB
    p params
  end

  private

  def review_params
    params.require(:review).permit(:user, :restaurant, :username, :content_title, :content, :rating, :token, :email)
  end

  def answer_params
    params.require(:answer).permit(:question, :content)
  end

  def valid_email(email)
    check = email =~ URI::MailTo::EMAIL_REGEXP
    return check == 0
  end

end
