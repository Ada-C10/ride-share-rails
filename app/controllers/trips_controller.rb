class TripsController < ApplicationController
  def home
  end

# This is the Passenger "show" page, where a Passenger can Request a Ride (create new trip)
  def index
    if params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id])
      @trips = @passenger.trips
    else
      render :notfound, status: :not_found
    end
  end

  def show
    id = params[:id].to_i
    @trip = Trip.find_by(id: id)

    if @trip.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    new_trip_params = {date: Date.today, rating: nil, cost: nil,
                       driver_id: Driver.first_available.id, passenger_id: params[:passenger_id]}
    @trip = Trip.new(new_trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id) # redirects to Trip show page
    else
      render :index # Passenger "show" page
      # TODO: test that this works
    end
  end

  def edit
    @trip = Trip.find(params[:id].to_i)
  end

  def update
    @trip = Trip.find_by(id: params[:id].to_i)
    formatted_trip_params = trip_params.dup
    if @trip.cost == nil
      formatted_trip_params[:cost] = @trip.assign_random_cost
      @trip.update(formatted_trip_params)
      redirect_to passenger_trips_path(@trip.passenger.id)
    else
      cost = formatted_trip_params[:cost].to_f
      formatted_trip_params[:cost] = (cost*100).to_i
      if @trip.update(formatted_trip_params)
        redirect_to trip_path(@trip.id)
      else
        render :edit
      end
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id].to_i)
    @trip = trip.destroy

    redirect_to root_path
    # TODO: add a conditional in case there's an exception
  end

  private

  def trip_params
    return params.require(:trip).permit(:date,:rating,:cost)
  end

end
