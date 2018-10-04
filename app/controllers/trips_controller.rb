class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips
    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end
end
