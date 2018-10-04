class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips

      @avg_trip_rating = avg_trip_rating(@trips)
    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def avg_trip_rating(trips)
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
end
