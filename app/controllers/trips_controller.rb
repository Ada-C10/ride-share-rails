class TripsController < ApplicationController
  def index

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
