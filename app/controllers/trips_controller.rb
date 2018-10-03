class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id].to_i)

    if @trip.nil?
     render :notfound, status: :not_found
    end
  end
  
end
