require 'date'

class TripsController < ApplicationController
  def index
    @trips = (Trip.all).sort_by do |trip|
      trip.id
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def self.find_available_driver
   drivers = Driver.all
   driver = drivers.find_by(available?: true)
   if driver
     driver.update(available?: false)
     driver.save
     return driver
   end
 end

 def create
   if params[:passenger_id]
     passenger = Passenger.find_by(id: params[:passenger_id])
     driver = Driver.all.sample
     @trip = passenger.trips.new(driver_id: driver.id, passenger_id: passenger.id, date: Time.now, cost: 0.0)
      if @trip.save
        redirect_to passenger_path(passenger.id)
      end
    else
      render :new
    end
  end

  def update
    trip = Trip.find(params[:id])
    if trip.update(trip_params)
      redirect_to trip_path(trip.id)
    else
      head :not_found
    end
  end

  def rated
    trip = Trip.find_by(id: params[:id])
     trip.update(rating: params[:rating])
    redirect_to trip_path(trip.id)
  end

  def destroy
     trip = Trip.find_by(id: params[:id])
      trip.destroy
     redirect_to trips_path
   end

  private

  def trip_params
    return params.require(:trip).permit(
      :passenger_id,
      :driver_id,
      :date,
      :rating,
      :cost
    )
  end
end
