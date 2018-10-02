class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.new(trip_params)

    if trip.save
      redirect_to trip_path(trip.id)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def update
    trip = Trip.find_by(id: params[:id].to_i)
    trip.update(trip_params)

    redirect_to trip_path(trip.id)
  end

  def destroy
    @deleted_trip = Trip.find_by(id: params[:id].to_i)
    @deleted_trip.destroy
  end

  private

    def trip_params
      return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
    end
end
