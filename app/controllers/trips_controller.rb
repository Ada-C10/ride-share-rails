class TripsController < ApplicationController
  def show
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def index
    if params[:driver_id]
      driver_id = params[:driver_id]
      @trips = Trip.find_by(id: driver_id)
    elsif params[:passenger_id]
      passenger_id = params[:passenger_id]
      @trips = Trip.find_by(id: passenger_id)
    else
      @trips = Trip.all
    end
  end

  def new
    @trip = Trip.new

  end

  def create
    passenger = Passenger.find_by(id: params[:passenger_id].to_i)
    @trip = passenger.trips.new(date: Date.today, driver_id: Driver.find_driver.id, cost: 0, status: "In Progress")
    if @trip.save
      redirect_to passenger_trip_inprogress_path(@trip.passenger.id, @trip.id)
    else
      redirect_to :bad_request
    end

  end

  def in_progress
    @trip = Trip.find_by(id: params[:id])
    @passenger = Passenger.find_by(id: params[:passenger_id].to_i)
  end

  def edit
    if params[:passenger_id]
      @trip = Trip.find_by(id: params[:passenger_id])
    else
      @trip = Trip.find_by(id: params[:id].to_i)
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    @trip.update(trip_params)
    if @trip.save
      redirect_to passenger_trip_path(@trip.passenger.id, @trip.id)
    else
      render :new
    end
  end



  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end
