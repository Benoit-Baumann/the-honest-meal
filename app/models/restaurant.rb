class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, class_name: 'User'
  
  validates :owner, presence: true
  validates :name, presence: true # scoper nom avec ville ?
  # validates :category, presence: true
  validates :address, presence: true
  # validates :description, presence: true
  # validates :hours, presence: true
  validates :pricing, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..3 }
  # validates :phone_number, presence: true # regex numéro francais
  # validates :website, presence: true
end
