class TripsController < ApplicationController
  def index
    @trips = Trip.all.paginate(page: params[:page], per_page: 8)
  end

  def create
    trip = Trip.new(trip_params)
    trip.cost = rand(100...5000)
    trip.date = Time.now
    trip.driver = Driver.next_available

    if trip.save
      redirect_to passenger_path(trip.passenger.id)
    else
      #redirect to passenger page with error no available drivers
    end
  end

  def show
    @trip = Trip.find(params[:id].to_i)

    if @trip.nil?
     render :notfound, status: :not_found
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id].to_i)
  end

  def update
    trip = Trip.find_by(id: params[:id].to_i)
    trip.update(trip_params)

    redirect_to trip_path(trip.id)
  end

  def destroy
    @trip = Trip.find_by(id: params[:id].to_i)
    @trip.destroy
    redirect_to trips_path
  end


  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :rating)
  end


end
