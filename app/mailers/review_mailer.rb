class ReviewMailer < ApplicationMailer
  def send_link
    @email = params[:email]
    @review = params[:review]
    # @review_link = "http://localhost:3000/reviews/#{@review.token}/edit"
    mail(to: @email, subject: 'Laisser votre avis !')
  end
end
