class AddTokenToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :token, :string
    add_index :reviews, :token, unique: true
  end
end