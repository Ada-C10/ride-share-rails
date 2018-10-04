class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  def request_trip(user_id)
    trip_params = {
      driver_id:, #insert mtch driver method find_available_driver(user_id),
      passenger_id: params[:id],
      date: DateTime.now
      cost: (0.0..10.00).sample
      rating:nil
    }
    requested_trip = Trip.new(new_trip)

    requested_trip.driver.add_driven_trip(requested_trip)

    requested_trip.passenger.add_trip(requested_trip)
    @trips << requested_trip



      return new_trip

    end


end
