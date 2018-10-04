class TripsController < ApplicationController
  def index
    if params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = @passenger.trips
    else
      @trips = Trip.all.order(:date, :desc)
    end
  end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
      render :notfound, status: :not_found
    end
    #   id = params[:id].to_i
    #   @passenger = Passenger.find_by(id: id)
    #
    #   if @passenger.nil?
    #     render :notfound, status: :not_found
    #   end
  end

  # def create
  #   driver_id = Driver.first_available.id
  #   passenger_id = params[:data] # this might not work
  #   new_trip_params = {date: Date.today, rating: nil, cost: nil,
  #                      driver_id: driver_id, passenger_id: passenger_id}
  #   @trip = Trip.new(new_trip_params)
  #   @trip.save # make sure to validate this later?
  #   redirect_to passenger_path(@trip.passenger.id) #probably works!
  # end

  def edit
    @trip = Trip.find(params[:id].to_i)
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    formatted_trip_params = trip_params.dup
    cost = formatted_trip_params[:cost].to_f
    formatted_trip_params[:cost] = (cost*100).to_i
    @trip.update(formatted_trip_params)

    redirect_to trip_path(@trip.id)
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    trip.destroy

    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:date,:rating,:cost)
  end

end
