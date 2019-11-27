# Preview all emails at http://localhost:3000/rails/mailers/review_mailer
class ReviewMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/review_mailer/welcome
  def send_link
    ReviewMailer.with(review: Review.last, email: "toto@gmail.com").send_link
  end
end
