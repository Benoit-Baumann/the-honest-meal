class RemoveReviewIdFromAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :answers, :review, foreign_key: true
  end
end
