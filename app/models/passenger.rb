class Passenger < ApplicationRecord
  has_many :trips

  def all_trips
    @all_trips = []
    @all_trips << Trip.where(passenger_id: id)
    return @all_trips
  end

  def total_spent
    rides = all_trips
    charges_array = []

    rides.each do |ride|
      ride.each do |individual|

        if individual.cost != nil
          charges_array << individual.cost
        end
      end
    end
    return charges_array.sum
  end


end
