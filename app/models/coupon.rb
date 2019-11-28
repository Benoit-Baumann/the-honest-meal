class Coupon < ApplicationRecord
  belongs_to :restaurant

  validates :details, presence: true
  validates :is_valid, presence: true
end
