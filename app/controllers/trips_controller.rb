class TripsController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render :dit
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    trip.destroy
    # goes back to previous page
    redirect_to drivers_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :driver_id, :date, :rating, :cost)
  end
end
