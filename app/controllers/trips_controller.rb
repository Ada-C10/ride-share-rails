class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

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

  def update
      @trip = Trip.find_by(id: params[:id].to_i)
    if  @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      render :edit
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to passenger_path(@passenger.id)
    else
      render :new
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    @deleted_trip = trip.destroy

    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:id, :date, :rating)
  end
end
