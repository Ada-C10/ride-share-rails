class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @user = Driver.find_by(id: params[:driver_id])
      @trips = @user.trips

    elsif params[:passenger_id]
      @user = Passenger.find_by(id: params[:passenger_id])
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
    #change all this to passenger information
      @user = Driver.find_by(id: params[:driver_id])
      @user_2 = Passenger.find(2)
      @trip = @user.trips.new()

      @trip.driver = @user
      @trip.passenger = @user_2
      @trip.date = Date.today
      @trip.rating = nil
      @trip.cost = 1000000000


    if @trip.save
      redirect_to driver_trips_path
    else
      render :index
    end
  end
end


private

def trip_params
  return params.require(:trip).permit(
    :driver_id, :passenger_id, :date, :rating, :cost
  )
end
