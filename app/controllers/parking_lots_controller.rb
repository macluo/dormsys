class ParkingLotsController < ApplicationController
  def index
    @parking_lots = ParkingLot.all
  end
end