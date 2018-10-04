class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips

      @avg_trip_rating = avg_trip_rating(@trips)
      @total_trip_earnings = total_trip_earnings(@trips)
    else
      @trips = Trip.all
    end
  end

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def edit
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)
  end

  def update
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    result = @trip.update(trip_params)

    if result
      redirect_to driver_trips_path(@driver.id)
    else
      render :edit
    end
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

  def total_trip_earnings(trips)
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

  private
  def trip_params
    return params.require(:trip).permit(
      :date,
      :rating,
      :cost,
      :passenger_id,
      :driver_id
    )
  end
end
