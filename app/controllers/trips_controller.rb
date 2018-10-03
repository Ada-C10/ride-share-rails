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
    filtered_params = trip_params()
    @trip = Trip.new(filtered_params)
    save_success = @trip.save
    if save_success
      redirect_to trips_path
    else
      render :new
    end
  end

  def new
    @trip = Trip.new
  end

  def show
    trip_id = params[:id]
    @trip= Trip.find_by(id: trip_id)
    if @trip.nil?
      head :not_found
    end
  end
  private

  def trip_params
    return params.require(:trip).permit(
      :name,
      :phone_num,
    )
  end



end
