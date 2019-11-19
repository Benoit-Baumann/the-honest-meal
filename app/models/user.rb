class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants, foreign_key: :owner_id
  has_many :reviews
  has_many :coupons
  has_many :favorites

  enum status: [:customer, :owner]

  validates :username, uniqueness: { case_sensitive: false }#, presence: true
end
