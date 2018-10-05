class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips

    elsif params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips

    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    if @trip
      return @trip
    else
      head :not_found
    end

  end

  def new
    @trip = Trip.new
  end

  def create
    all_avail_drivers = Driver.where(available: true)
    first_avail_driver = all_avail_drivers.first

    passenger_id = params[:passenger_id]
    @trip = Trip.new(
      date: Date.today,
      rating: 0.0,
      cost: 0,
      driver_id: first_avail_driver.id,
      passenger_id: passenger_id
    )

    # Change driver's availability
    first_avail_driver.update(available: false)



    result = @trip.save

    if result
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def edit
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def update
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    result = @trip.update(trip_params)

    if result
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def destroy
    trip_id = params[:id]
    passenger_id = params[:passenger_id]
    driver_id = params[:driver_id]

    @trip = Trip.find_by(id: trip_id)

    if @trip
      @trip.destroy
      # NOTE: wanted to use redirect_back(fallback_location: root_path), but wouldn't work when I deleted a trip from trip details page
      redirect_to root_path
    else
      head :not_found
    end

  end


  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost,
      :passenger_id,
      :driver_id
    )
  end

  # NOTE: add private params????
end
