class Passenger < ApplicationRecord
  has_many :trips

  def total_cost
    #The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
     total_cost = self.trips.reduce(0) { |sum, trip|
       if trip.cost == nil
         sum + 0
       else
         sum + trip.cost
       end
     }
     total_cost /= 100.0
     return total_cost.round(2)
  end

  def status
    if self.trips.any? { |trip| trip.cost == nil || trip.rating == nil }
      return :in_progress
    else
      return :available
    end
  end

end
