class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify

  def all_trips
    temp_trips = []
    all_trips = []
    temp_trips << Trip.where(passenger_id: id)
    temp_trips.each do |trips|
      trips.each do |trip|
        all_trips << trip
      end
    end
    return all_trips
  end

  def total_spent
    rides = all_trips
    charges_array = []

    rides.each do |ride|
      if ride.cost != nil
        charges_array << ride.cost
      end
    end
    return charges_array.sum
  end


end
