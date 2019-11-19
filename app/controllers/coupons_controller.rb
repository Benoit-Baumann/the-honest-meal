class CouponsController < ApplicationController

  def index
    @coupons = current_user.coupons
  end
end
