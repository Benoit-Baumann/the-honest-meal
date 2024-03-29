class User < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  before_save :set_random_avatar
  after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :restaurants, foreign_key: :owner_id
  has_many :reviews
  has_many :coupons
  has_many :favorites
  has_many :question_pools

  enum status: [:customer, :owner]

  validates :username, uniqueness: { case_sensitive: false }, presence: true

  private

  def set_random_avatar
    unless photo?
        avatar_url = Dir["#{Rails.root}/app/assets/images/avatars/*"].sample
        self.photo = Pathname.new(Rails.root.join(avatar_url)).open
        save
    end
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now if self.email.downcase == 'baumann.benoit@gmail.com'
  end

end
