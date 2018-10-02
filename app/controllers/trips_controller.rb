class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def create
    raise
    driver = Driver.order("RANDOM()").limit(1)
    trip_hash = {driver_id: driver, passenger_id: 1, date: DateTime.now, cost: rand(1..5000)}
    @trip = Trip.create(trip_hash)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end


end
