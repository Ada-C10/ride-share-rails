class TripsController < ApplicationController

  def index
    @trips = Trips.all
  end

  def edit
      @trip = Trips.find_by(id: params[:id])
    end

  def destroy
    trip = Trips.find_by(id: params[:id])
    trip.destroy
    redirect_to root_path
  end







end
