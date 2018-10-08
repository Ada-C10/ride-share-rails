class TripsController < ApplicationController
  include TripsHelper

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
    @trip = Trip.new(
      date: Date.today,
      cost: get_cost,
      passenger_id: params[:passenger_id],
      driver_id: first_available_driver
    )

    if @trip.save
      @trip.driver.update_attribute(:status, false)
      redirect_to trip_path(@trip)
    else
      redirect_to passenger_path(params[:passenger_id]), status: :bad_request
    end
  end

  def update
    trip = Trip.find(params[:id])

    if trip.update(trip_params)
      redirect_to trip_path(trip.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    passenger_id = trip.passenger.id

    if trip.destroy
      redirect_to passenger_path(passenger_id)
    else
      render :index, status: :bad_request
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(
      :rating
    )
  end


end
