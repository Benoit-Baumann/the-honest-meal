class AddUsernameToCoupons < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :username, :string
  end
end
