class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :update]

  def index
    @reviews = current_user.reviews
  end

  def new
  end

  def create
    @email = params[:email]
    unless valid_email(@email)
      render :invalid_email
      return

    end
    @restaurant = Restaurant.find(params[:restaurant])
    @review = Review.new(restaurant: @restaurant)
    if @review.save
      ReviewMailer.with(review: @review, email: @email).send_link.deliver_now
    else
      render :invalid_email
    end
  end

  def edit
    @answer = Answer.new
    @review = Review.find_by(token: params[:id])
    if @review.nil?
      render :invalid_review
    elsif (Time.now - @review.created_at.to_time)/1.day > 7
      render :expired_review, locals: { review: @review }
    else
      if @review.restaurant.owner.question_pools.empty?
        @questions = nil
      else
        @questions = QuestionPool.find_by(user_id: @review.restaurant.owner.id).questions
      end
    end
  end

  def update
    @review = Review.find_by(token: review_params[:token])
    @review.update!(content_title: review_params[:content_title], content: review_params[:content], rating: review_params[:rating], username: current_user.username)

    p answer_params[:answers].last[:content]
    answer_params[:answers].each do |answer|
      Answer.new(content: answer[:content], question_id: answer[:question_id]).save!
    end
  end

  private

  def review_params
    params.require(:review).permit(:user, :restaurant, :username, :content_title, :content, :rating, :token, :email)
  end

  def answer_params
    params.require(:review).permit(answers: [:question_id, :content])
  end

  def valid_email(email)
    check = email =~ URI::MailTo::EMAIL_REGEXP
    return check == 0
  end

end
