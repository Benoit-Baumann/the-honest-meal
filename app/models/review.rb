class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: false
  has_many :answers

  # validates :user, presence: true
  validates :username, uniqueness: { case_sensitive: false }, presence: true, unless: :user_id? #Username requis si user_id absent (user non connecté ou ne possédant pas de compte)
  # validates :restaurant, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validates :content_title, presence: true, length: { maximum: 25 }
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
