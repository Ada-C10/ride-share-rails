class TripsController < ApplicationController
  def index
    if params[:passenger_id]
      # This is the nested route
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips.order(:date)

    elsif params[:driver_id]
      # This is the nested route
      driver = Driver.find_by(id: params[:driver_id])
      @trips = driver.trips

    else
      # This is the 'regular' route
      @trips = Trips.all.order(:date)
    end
  end

  def new
    if params[:pessenger_id]
      # This is the nested route
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips.new

    else
      # This is the 'regular' route, /books/new
      @trips = Trips.new
    end
  end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
     render :notfound, status: :not_found
    end
  end

end
