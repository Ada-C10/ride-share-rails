class TripsController < ApplicationController

  def index
    @trips = Trip.all
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
    filtered_trip_params = trip_params
    @trip = Trip.new(filtered_trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    if trip.update(trip_params)
      redirect_to trip_path(trip.id)
    else
      head :not_acceptable
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(
      :driver_id,
      :passenger_id,
      :date,
      :rating,
      :cost
    )
  end
end
