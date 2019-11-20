class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
    @favorites = Favorite.where(user_id: current_user.id, value: true)
  end
end
