class AddSiretToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :siret, :string
  end
end