class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
    trip = Trip.new(trip_params)
    trip.cost = rand(100...5000)
    trip.date = Time.now
    trip.driver = Driver.next_available

    if trip.save
      redirect_to passenger_path(trip.passenger.id)
    else
      #redirect to passenger page with error no available drivers
    end
  end

  def show
    @trip = Trip.find(params[:id].to_i)

    if @trip.nil?
     render :notfound, status: :not_found
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id)
  end


end
