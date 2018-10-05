class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trips_path
  end

  def destroy
    trip = Trip.find_by(id: params[:id])
    trip.destroy
    redirect_to root_path
  end

  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id:
        params[:passenger_id])
        driver = Driver.all.sample
        @trip = passenger.trips.new(driver_id: driver.id, passenger_id: passenger.id, date: "2018-06-01", rating: nil, cost: nil)
        if @trip.save
          redirect_to root_path
        else
          render :new
        end
      end
    end

      def show
        trip_id = params[:id]
        @trip= Trip.find_by(id: trip_id)
        if @trip.nil?
          head :not_found
        end
      end
end
