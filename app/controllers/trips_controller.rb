class TripsController < ApplicationController
  def index
    if params[:driver_id]
      driver_id = params[:driver_id]
      @trips = Driver.find_by(id: driver_id).trips.order(:date)
    else
      @trips = Trip.all.order(:date)
    end
  end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
      render :not_found, status: :not_found
    end
  end

  def edit
    @trip = Trip.find(params[:id].to_i)
  end

  def create
    ##### TODO Add error messages for if it does not save ####
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def new
    @trip = Trip.new
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    trip.destroy
    redirect_to trips_path
  end

  def update
    trip = Trip.find_by(id: params[:id].to_i)
    trip.update(trip_params)
    ###### TODO Add error message for if it does not save  #####
    redirect_to trip_path(trip.id)
  end

  private

    def trip_params
      return params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
    end

end
