class AddNameToQuestionPool < ActiveRecord::Migration[5.2]
  def change
    add_column :question_pools, :nameq, :string
  end
end
