class Passenger < ApplicationRecord
  has_many :trips

  def total_cost
  #The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
   total_cost = self.trips.reduce(0) { |sum, trip| sum + trip.cost }
   total_cost /= 100.0
   return total_cost.round(2)
  end
end
