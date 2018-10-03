class TripsController < ApplicationController
<<<<<<< HEAD
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


=======
>>>>>>> 7f55b539064611065a73f87105d0b8ca4458aba1
  def show
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def update
    trip = Trip.find_by(id: params[:id])
    trip.update(trip_params)

    if trip.save
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy

    redirect_back(fallback_location: root_path)
    # why is it trying to run the show method and view
  end

<<<<<<< HEAD
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
    
=======
  # to create a link to it on passenger page
  def create
    # passenger = Passenger.find_by(id: params[:id])
    # driver = Driver.all.where(status: true).first
    # trip = Trip.new(date: Date.current, driver: driver.id, passenger: passenger.id)
    # if trip.save
    #   driver.status = false
    #   driver.save
    #   redirect_to passenger_path
    # else
    #   something
    # end
  end

  private
  def trip_params
    return params.required(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
>>>>>>> 7f55b539064611065a73f87105d0b8ca4458aba1
  end

  # private
  # def trip_params
  #   return params.require(:trip).permit(:driver_id, :passenger_id)
  #  end
end
