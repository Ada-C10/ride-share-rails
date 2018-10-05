class TripsController < ApplicationController

  def index
    if params[:driver_id]
      driver = Driver.find_by(id: params[:driver_id])
      @trips = driver.trips
    elsif params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips
    else
      @trips = Trip.all
    end
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
    driver = Driver.find_by(status: true)

    if driver
      @trip = Trip.new(cost: 0, rating: 5, date: '2000-01-01', driver_id: driver.id, passenger_id: passenger.id)
      if @trip.save
        redirect_to passenger_trips_path
      else
        render :new, status: :bad_request
      end
    else
      redirect_to root_path
    end

  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    result = @trip.update(trip_params)

    if result
      redirect_to trip_path(@trip.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    trip.destroy
    redirect_to trips_path
  end

  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost
    )
  end

end
