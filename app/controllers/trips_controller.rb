class TripsController < ApplicationController
  def index
    if params[:driver_id]
    #   # NOTE: changed instance var driver to normal var driver
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips
    #
    #   # TODO: need to move this business logic to model
    #   @avg_trip_rating = avg_trip_rating(@trips)
    #   @total_trip_earnings = total_trip_earnings(@trips)
    #
    elsif params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips
    #
    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  # def new
  #   @trip = Trip.new
  # end

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

    # prob need to manually enter the params in for at least driver id and passenger id
    # TODO: add availability column to driver db. default status: :unavailable
    # passenger = Passenger.find_by(id: params[passenger_id])
    # find first avail driver
    # avail_driver = Driver.find_by(status: :available)[0] OR Driver.find(status: :available)
    # avail_driver[status] = :unavailable or avail_driver.status = :unavailable i don't remember which
    # @trip = Trip.new(avail_driver.id)

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
    if trip_id
      @trip = Trip.find_by(id: trip_id)
      @trip.destroy
      redirect_to passenger_path(@trip.passenger_id)
    else
      return head :not_found
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
