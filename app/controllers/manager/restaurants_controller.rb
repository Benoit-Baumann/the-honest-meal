class Manager::RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurants, only: [:index, :dashboard]

  def index
    # @restaurants = current_user.restaurants
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = current_user
    @restaurant.save
    redirect_to manager_restaurant_path(@restaurant)
  end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to manager_restaurant_path(@restaurant)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to manager_restaurants_path
  end

  def dashboard
    # @restaurants = current_user.restaurants
    @review = Review.new
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :description, :hours, :pricing, :phone_number, :website)
  end
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_restaurants
    @restaurants = current_user.restaurants
  end

end
