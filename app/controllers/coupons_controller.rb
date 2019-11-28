class CouponsController < ApplicationController

  def index
    @coupons = current_user.restaurants.last.coupons
  end
end
