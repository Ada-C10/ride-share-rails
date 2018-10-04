class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    if @trip.nil?
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
      render :new, status: :bad_request
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  #edit from here on
  def update
    trip = Trip.find(params[:id])
    if trip.update(trip_params)
      redirect_to trip_path
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

      trip.destroy
      redirect_to trips_path

  end


  private

  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost,
      :driver_id,
      :passenger_id

    )
  end

end
