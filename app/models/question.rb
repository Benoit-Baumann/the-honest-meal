class Question < ApplicationRecord
  belongs_to :question_pool
  has_many :answers
end
