class AddCatToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :cat, :string
  end
end
