class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :phone_number, :string
    add_column :users, :status, :integer
  end
end
