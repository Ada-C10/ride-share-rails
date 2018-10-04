require 'date'

class TripsController < ApplicationController
  def index
    if params[:passenger_id]
      # This is the nested route
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = passenger.trips.order(:date)

    elsif params[:driver_id]
      # This is the nested route
      driver = Driver.find_by(id: params[:driver_id])
      @trips = driver.trips

    else
      # This is the 'regular' route
      @trips = Trip.all.order(:date)
    end
  end

  # def new
  #   if params[:pessenger_id]
  #
  #     passenger = Passenger.find_by(id: params[:passenger_id])
  #     @trips = passenger.trips.new
  #
  #   else
  #
  #     @trips = Trip.new
  #   end
  # end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
     render :notfound, status: :not_found
    end
  end


  def edit
    @trip = Trip.find(params[:id].to_i)
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)

     @deleted_trip = trip.destroy

    redirect_to trips_path
  end


  def create
    if params[:passenger_id]
      passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = passenger.trips.new
      driver_picked = Driver.random_active_driver
      @trip.driver_id = driver_picked.id
      @trip.cost = 10
      @trip.date = Date.today
    else
      @trip = Trip.new
    end

    if @trip.save
      redirect_to passenger_path(id: passenger.id)
    else
      redirect_to trip_path
    end
  end

  def update
      @trip = Trip.find_by(id: params[:id].to_i)
      if @trip.update(trip_params)

        redirect_to trip_path(@trip.id)
      else
        render :edit
      end

  end

  private

    def trip_params
      return params.require(:trip).permit(:name, :phone_num)
    end



end
