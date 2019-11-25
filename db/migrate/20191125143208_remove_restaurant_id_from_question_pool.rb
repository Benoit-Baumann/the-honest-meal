class RemoveRestaurantIdFromQuestionPool < ActiveRecord::Migration[5.2]
  def change
    remove_reference :question_pools, :restaurant, foreign_key: true
  end
end
