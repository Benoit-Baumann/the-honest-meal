class AddValuetoFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :value, :boolean
  end
end
