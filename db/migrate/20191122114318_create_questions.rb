class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :restaurant, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
