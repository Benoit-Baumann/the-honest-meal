class ChangeTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :ty
