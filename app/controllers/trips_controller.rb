class TripsController < ApplicationController
  def index

  end


  def show

    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end

  end

  def new

  end


  def create


  end


  def create

  end


  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :driver_id,
      :passenger_id,
      :price,
      :rating,
    )
  end
end
