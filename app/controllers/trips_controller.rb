class TripsController < ApplicationController
  def index
    @trips = trip.all.order(:name)
  end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find(params[:id].to_i)
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    trip.destroy

    redirect_to trips_path
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip.id) #does this need to be to integer?
    else
      render :new
    end
  end

  def update
    trip = Trip.find_by(id: params[:id].to_i)
    trip.update(trip_params)

    redirect_to trip_path(@trip.id)
  end

  private

  def trip_params
    return params.require(:trip).permit(:date,:rating,:cost)
  end

end
