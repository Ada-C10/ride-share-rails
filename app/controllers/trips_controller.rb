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
    driver = Driver.avail_status
    @trip = Trip.new(filtered_trip_params.merge(:driver_id => driver.id))

    is_successful_save = @trip.save && driver.update_status

    if is_successful_save
      redirect_to passenger_path(filtered_trip_params[:passenger_id])
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
      redirect_to passenger_path(trip[:passenger_id])

  end


  private

  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost,
      :passenger_id

    )
  end

end
