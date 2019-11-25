class AddUserToQuestionPool < ActiveRecord::Migration[5.2]
  def change
    add_reference :question_pools, :user
  end
end
