class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    if @trip.nil?
      head :not_found
    end
  end


  private

  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost,
      :driver_id,
      :passenger_id

    )
  end

end
