class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find(trip_id)
    if @trip == nil
      head :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    filtered_trip_params = trip_params()
    @trip = Trip.new(filtered_trip_params)

    is_successful_save = @trip.save

    if is_successful_save
      redirect_to trips_path
    else
      render :new
    end
  end
  #
  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)

    redirect_to trip_path(trip.id)
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    trip.destroy
    redirect_to trips_path
  end

  private
  #
  # # Strong params: only let certain attributes
  # # through
  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost
    )
  end
end
