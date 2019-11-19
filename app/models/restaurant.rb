class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  validates :owner, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :hours, presence: true
  validates :pricing, presence: true, numericality: { only_integer: true, less_than: 6 }
  validates :phone_number, presence: true
  validates :website, presence: true
end
