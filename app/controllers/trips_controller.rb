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
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips.new
    end
  end

  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips

    else
      @trips = Trip.all
    end


  end
end
