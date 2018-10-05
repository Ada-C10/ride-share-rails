class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def new
    @trip = Trip.new
    @trip.date = Date.today
    @trip.rating = 0
    @trip.cost = 5
  end

  def create
    @trip = Trip.new(passenger_params)
    if @trip.save
      redirect_to passenger_trips_path
    else
      puts "#{@trips.errors}"
      render :new
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    trip.destroy
    # goes back to previous page
    redirect_to drivers_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :driver_id, :date, :rating, :cost)
  end
end
