class TripsController < ApplicationController
  before_action :get_trip, only: [:edit, :update, :destroy]
  def get_trip
    @trip = Trip.find(params[:id].to_i)
  end

  def index
    if params[:passenger_id]
      # This is the nested route, /passenger/:passenger_id/trips
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = passenger.trips

    else
      # This is the 'regular' route, /trips
      @trips = Trip.all
    end
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
    if params[:passenger_id]
      @passenger_id = params[:passenger_id].to_i
      driver = Driver.new_trip_driver
      @trip = Trip.new(driver_id: driver, passenger_id: @passenger_id, date: DateTime.now)
      if @trip.save
        redirect_to trips_path
      else
        render :new
      end
    end
  end

  def create
    
  end

  # private
  # def trip_params
  #   return params.require(:trip).permit(:driver_id, :passenger_id)
  #  end
end
