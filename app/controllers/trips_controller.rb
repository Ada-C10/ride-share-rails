class TripsController < ApplicationController
  def index
    if params[:driver_id]
      # NOTE: changed instance var driver to normal var driver
      driver = Driver.find_by(id: params[:driver_id])
      @trips = driver.trips

      # TODO: need to move this business logic to model
      @avg_trip_rating = avg_trip_rating(@trips)
      @total_trip_earnings = total_trip_earnings(@trips)

    elsif params[:passenger_id]
      passenger = Driver.find_by(id: params[:passenger_id])
      @trips = passenger.trips

    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def destroy
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    if @trip
      @trip.destroy
      redirect_to root_path
    else
      return head :not_found
    end
  end

  def avg_trip_rating(trips)
    # TODO: move this business logic to model

    num_of_trips = trips.count

    trip_rating_array = trips.map do |trip|
      trip.rating
    end

    sum_of_ratings = 0
    trip_rating_array.each do |rating|
      sum_of_ratings += rating
    end

    return sum_of_ratings / num_of_trips
  end

  def total_trip_earnings(trips)
    # TODO: move this business logic to model
    total_num_of_trips = trips.count

    trip_cost_array = trips.map do |trip|
      (trip.cost.to_f) / 100
    end

    sum_of_all_trips = 0
    trip_cost_array.each do |cost|
      sum_of_all_trips += cost
    end

    revenue = (sum_of_all_trips - (total_num_of_trips * 1.65)) * 0.8
    return revenue.round(2)
  end

  # NOTE: add private params????
end
