class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @userfavorite = Favorite.where(user: current_user, restaurant: @restaurant).first
    if @userfavorite.nil?
      @toto = false
    else
      @toto = @userfavorite.value
    end
  end

  def toggle_favorites
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    userfavorite = Favorite.where(user: current_user, restaurant: @restaurant).first
    if userfavorite.nil?
      Favorite.create(user: current_user, restaurant: @restaurant, value: true)
    else
      userfavorite.toggle("value")
      userfavorite.save!
    end
  end
end
