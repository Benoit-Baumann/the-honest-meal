class CreateQuestionPools < ActiveRecord::Migration[5.2]
  def change
    create_table :question_pools do |t|
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
