class TripsController < ApplicationController
  before_action :get_passenger, only: [:edit, :update, :destroy]
  def get_passenger
    @passenger = Passenger.find(params[:id].to_i)
  end

  def index
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
    @trip= Trip.new
  end

  def create
    driver = Driver.new_trip_driver
    @trip = Trip.new(driver, @passenger_id)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  private
  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id)
   end
end
