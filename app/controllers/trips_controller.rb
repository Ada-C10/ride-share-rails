class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def autocreate
    offset = rand(Driver.count)
    driver = Driver.offset(offset).first
    trip_hash = {driver_id: driver.id, passenger_id: params[:id].to_i, date: DateTime.now, cost: rand(1..5000)}
    @trip = Trip.new(trip_hash)
    @trip.save
    redirect_to trip_path(@trip.id)
  end

  def edit
  end

  def update
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  def index
    @trips = Trip.all
  end

  def show
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
