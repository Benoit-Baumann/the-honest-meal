class RestaurantPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :restaurant

  validates :photo, presence: true
end
