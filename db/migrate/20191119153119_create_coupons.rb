class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.string :details
      t.boolean :is_valid, default: true

      t.timestamps
    end
  end
end
