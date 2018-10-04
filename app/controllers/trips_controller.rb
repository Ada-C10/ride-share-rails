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
    trip = Trip.new(driver_id: params[:trip][:driver_id], passenger_id: params[:trip][:passenger_id], date: Date.now, rating: nil, cost: rand(5..20)) #instantiate a new trip

    successful_save = trip.save

    if successful_save # save returns true if the database insert succeeds
      redirect_to all_trips_path # go to the index so we can see the trip in the list
    else # save failed :(
      render :new # show the new trip form view again
    end

  end


end
