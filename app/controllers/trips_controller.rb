class TripsController < ApplicationController
  def index

    if params[:passenger_id]
      @user = Passenger.find_by(id: params[:passenger_id])
      @trips = @user.trips

    elsif params[:driver_id]
      @user = Driver.find_by(id: params[:driver_id])
      @trips = @user.trips

    else
      @trips = Trip.all

    end
  end

  def show
    if params[:driver_id]
      @user = Driver.find_by(id: params[:driver_id])
      @trips = @user.trip.find_by(params[:driver_id])

    elsif params[:passenger_id]
      @user = Passenger.find_by(id: params[:passenger_id])
      @trips = @user.trips

    else
      @trips = Trip.all
    end

  end

  def create

    @passenger = Passenger.find_by(id: params[:passenger_id])
    @driver = Driver.find_by(status: true)
    @trip = @passenger.trips.new()

    @trip.driver = @driver
    @trip.passenger = @passenger
    @trip.date = Date.today
    @trip.rating = nil
    @trip.cost = rand(1..10)

    @driver.update_attribute(:status, false)

    if @trip.save
      redirect_to passenger_trips_path
    else
      # raise an error message
    end

  end



  private

  def trip_params
    return params.require(:trip).permit(
      :driver_id, :passenger_id, :date, :rating, :cost
    )

  end

end
