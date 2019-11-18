class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.references :owner, foreign_key: { to_table: :users }
      t.string :name
      t.string :type
      t.string :address
      t.text :description
      t.string :hours
      t.integer :rating
      t.integer :pricing
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
