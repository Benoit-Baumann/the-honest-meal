class RemoveRestaurantIdFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :questions, :restaurant, foreign_key: true
    add_reference :questions, :question_pool, foreign_key: true
  end
end
