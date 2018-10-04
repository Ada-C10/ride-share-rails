class TripsController < ApplicationController
  before_action :get_trip, only: [:show, :edit, :update]
  def get_trip
    @trip = Trip.find(params[:id].to_i)
  end

  def show
    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    if params[:passenger_id]
      @passenger_id = params[:passenger_id].to_i
      @passenger = Passenger.find(@passenger_id)
      if @passenger.verify_trip
        driver = Driver.new_trip_driver
        @trip = Trip.new(driver_id: driver, passenger_id: @passenger_id, date: DateTime.now, cost: 0, in_progress: true)
        @trip.save

        redirect_to passenger_path
      else
        redirect_to root_path
      end
    end
  end

  def edit
    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def update
    if @trip.rating != nil
      trip_params[:in_progress] = false
      trip_params[:cost] = rand(9999)
    end

    @trip.update(trip_params)

    if @trip.save
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id].to_i)
    trip.active = false

    if trip.save
      redirect_to root_path
    end
  end


  def create

    if params[:passenger_id]
      @passenger_id = params[:passenger_id].to_i
      @passenger.verify_trip
      driver = Driver.new_trip_driver
      @trip = Trip.new(driver_id: driver, passenger_id: @passenger_id, date: DateTime.now, cost: 0)
      if @trip.save
        redirect_to trips_path
      else
        # render :new
      end
    end
  end


  private
  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :rating, :in_progress, :active, :cost)
  end
end
