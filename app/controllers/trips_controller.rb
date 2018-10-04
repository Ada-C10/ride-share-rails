class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find(trip_id)
    if @trip == nil
      head :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def create

    #through passenger path
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      driver = find_available_driver

      @trip = Trip.new(passenger: passenger, driver: driver, cost: 0, date: Date.today)
      if driver == nil
        render :invalid_trip_page, status: :not_found
      else
        @trip.save
        redirect_to passenger_path(@trip.passenger_id)
      end
    else
      #through trip path
      filtered_trip_params = trip_params()
      @trip = Trip.new(filtered_trip_params)
      @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    end
  end
  #
  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)

    redirect_to trip_path(trip.id)
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    trip.destroy
    redirect_to trips_path
  end

  private
  #
  # # Strong params: only let certain attributes
  # # through
  def trip_params
    return params.require(:trip).permit(
      :passenger_id,
      :driver_id,
      :date,
      :rating,
      :cost
    )
  end
end
