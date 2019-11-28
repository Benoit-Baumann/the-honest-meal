class DeleteUserIdFromCoupons < ActiveRecord::Migration[5.2]
  def change
    remove_reference :coupons, :user, foreign_key: true
  end
end
