class TripsController < ApplicationController
  def index
    @trips = Trip.all.search(params[:term], params[:page])
  end

  def show
    @trip = Trip.find_by(id: params[:id].to_i)

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    if params[:passenger_id] # Nested route: /passenger/:passenger_id/trips/
      pax_id = params[:passenger_id].to_i
      @trip = Trip.new
    end

    if @trip.start_trip(pax_id) && @trip.save
      redirect_to passenger_path(pax_id)
    else
      redirect_to passenger_path(pax_id) # wish we add put an error msg here!
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)

    if trip_params[:rating] != nil
      @trip.end_trip
    end

    if @trip.update(trip_params)
      redirect_to trip_path(id: params[:id].to_i)
    else
      render :edit
    end
  end

  def destroy
    @deleted_trip = Trip.find_by(id: params[:id].to_i)
    @deleted_trip.destroy
  end

  private

    def trip_params
      return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
    end
end
