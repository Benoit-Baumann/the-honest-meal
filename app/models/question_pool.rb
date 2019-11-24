class QuestionPool < ApplicationRecord
  belongs_to :restaurant
  has_many :questions
  accepts_nested_attributes_for :questions
end
