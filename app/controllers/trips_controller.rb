class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips

    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def edit
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def update
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    result = @trip.update(trip_params)

    if result
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy
    redirect_to driver_trips_path(trip.driver_id)
  end


  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost,
      :passenger_id,
      :driver_id
    )
  end
end
