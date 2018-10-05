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
    @trip.cost = 5
    @trip.passenger_id = params[:passenger_id]
    @trip.driver_id = rand(1..100)
    @trip.rating = 0
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      puts "#{@trip.errors}"
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
