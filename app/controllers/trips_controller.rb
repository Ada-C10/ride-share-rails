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
    offset = rand(Driver.count)
    driver = Driver.offset(offset).first
    new_trip = {driver_id: driver.id, passenger_id: params[:passenger_id].to_i, date: DateTime.now, cost: rand(500..3000),rating: 1}
    @trip = Trip.new(new_trip)
    @trip.save
    redirect_to edit_trip_path(@trip.id)

  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    @deleted_trip = trip.destroy

    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:id, :driver_id, :passenger_id, :cost, :date, :rating)
  end
end
