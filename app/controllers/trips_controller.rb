class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)
  end

  def new
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = passenger.trips.new
    else
      @trip = Trip.new
    end
  end

  def create
    passenger = Passenger.find_by(id: params[:passenger_id])
    driver = Driver.first_available_driver

    if driver.nil?
      redirect_to passenger, alert: "NO DRIVERS AVAILABLE"
    end

    if !passenger.is_in_ride? && driver
      driver.toggle_availablity

      @trip = Trip.new
      @trip.passenger = passenger
      @trip.driver = driver
      @trip.date = Date.today
      @trip.cost = rand(1000..9999)

      if @trip.save
        redirect_to passenger_path(@trip[:passenger_id])
      else
        render :new
      end
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.driver.toggle_availablity
    if @trip.update(trip_params)
      redirect_to passenger_path(@trip[:passenger_id])
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip
      @trip.destroy
    end
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:id, :date, :rating, :cost, :driver_id, :passenger_id)
  end
end
