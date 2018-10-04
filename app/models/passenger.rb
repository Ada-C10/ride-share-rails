class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers, through: :trips

  def total_cost
    total = 0
    self.trips.each do |trip|
      total += (trip.cost/100.to_f)
    end
    return total
  end

  def list_trips
    trips = []
    self.trips.each do |trip|
      if trip.passenger_id == self.id
        trips << trip
      end
    end
    return trips
  end
end
