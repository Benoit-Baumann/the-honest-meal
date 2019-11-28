class ReviewMailer < ApplicationMailer
  def send_link
    @email = params[:email]
    @review = params[:review]
    mail(to: @email, subject: 'Laisser votre avis !')
  end
end
