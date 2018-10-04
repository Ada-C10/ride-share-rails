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

  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      driver = Driver.all.sample
      @trip = passenger.trips.new(driver_id: driver.id, passenger_id: passenger.id, date: Time.now, rating: 0, cost: 0)
      if @trip.save
        redirect_to passenger_path(passenger.id)
      end
    else
      render :new
    end
  end
end
