class CreateRestaurantPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_photos do |t|
      t.references :restaurant, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
