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
    @trip = Trip.new
  end

  def create

    passenger = Passenger.find_by(id: params[:passenger_id])
    driver = Driver.all.first

    @trip = Trip.new(
      passenger: passenger,
      driver: driver,
      date: Time.now.strftime("%Y-%m-%d"),
      cost: 0.0
    )

    if @trip.save
      redirect_to passenger_path(passenger.id)
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

  def rated
    trip = Trip.find_by(id: params[:id])

    trip.update(rating: params[:rating])
    redirect_to trip_path(trip.id)
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
