class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @all_trips = @trips.order("date").page(params[:page]).per_page(4)
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
    if @trip == nil
      render 'layouts/not_found_page', status: :not_found
    end
  end

  def new
    @trip = Trip.new
  end

#helper method for create trip
  def find_available_driver
    drivers = Driver.all
    driver = drivers.find_by(available?: true)
    if driver
      driver.update(available?: false)
      driver.save
      return driver
    end
  end

  def create

    #through passenger_trip path
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])

      driver = find_available_driver

      @trip = Trip.new(passenger: passenger, cost: 0, date: Date.today, driver: driver)
      if driver == nil
        render :invalid_trip_page, status: :not_found
      else
        @trip.save
        redirect_to passenger_path(@trip.passenger_id)
      end
    elsif !params[:passenger_id]
      #through trip_path
      filtered_trip_params = trip_params()
      @trip = Trip.new(filtered_trip_params)
      @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      #through nested path or if no driver found / hit back twice 
        redirect_to passengers_path
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
