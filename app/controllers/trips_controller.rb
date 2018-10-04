class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @user = Driver.find_by(id: params[:driver_id])
      @trips = @user.trips

    elsif params[:passenger_id]
      @user = Passenger.find_by(id: params[:passenger_id])
      @trips = @user.trips

    else
      @trips = Trip.all
    end
  end
end
