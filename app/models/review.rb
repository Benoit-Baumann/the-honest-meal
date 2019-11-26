class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurant

  before_validation :generate_token

  # validates :user, presence: true
  validates :username, presence: true, unless: :user_id?, on: :update #Username requis si user_id absent (user non connecté ou ne possédant pas de compte)
  validates :restaurant, presence: true
  validates :content, presence: true, length: { maximum: 1000 }, on: :update
  validates :content_title, presence: true, length: { maximum: 25 }, on: :update
  validates :rating, presence: true, inclusion: { in: 0..5 }, on: :update
  validates :token, presence: true, uniqueness: true

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Review.exists?(token: random_token)
    end
  end
end
