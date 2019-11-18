class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :reviews
end
