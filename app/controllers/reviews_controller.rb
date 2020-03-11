class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit, :update]

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
    elsif @review.updated_at > @review.created_at
      render :burnt_review
    elsif (Time.now - @review.created_at.to_time)/1.day > 7
      render :expired_review, locals: { review: @review }
    end
  end

  def update
    @review = Review.find_by(token: review_params[:token])
    username = review_params[:username].nil? ? '' : review_params[:username]
    if review_params[:username].nil?
      @review.user = current_user
      @username = current_user.username
    else
      @review.username = review_params[:username]
      @username = review_params[:username]
    end
    if @review.update(content_title: review_params[:content_title],
                      content: review_params[:content],
                      rating: review_params[:rating])
      @coupon = Coupon.new(restaurant: @review.restaurant,
        details: ['Un café gratuit au choix', 'Un dessert maison gratuit', "Une boisson fraîche gratuite"].sample,
        username: @username).save!
      render :validated_review
    else
      render :edit, locals: { review: @review }
    end

    answer_params[:answers].each do |answer|
      Answer.new(content: answer[:content], question_id: answer[:question_id]).save
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
