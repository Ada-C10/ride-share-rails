class Passenger < ApplicationRecord
  has_many :trips

  def total_cost
    total_cost = self.trips.reduce(0) { |sum, trip| sum + trip.cost }

    return total_cost
  end

end
