class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def create
    @trip = Trip.new
    @trip.update(@trip.fill_trip_hash)
    redirect_to trip_path(@trip.id)
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  def index
    @trips = Trip.paginate(:page => params[:page], :per_page => 20)
  end

  def show
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    return params.require(:trip).permit(:rating, :date, :cost)
  end

end
