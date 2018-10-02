class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
  #The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
   total_cost = self.trips.reduce(0) { |sum, trip| sum + trip.cost }
   num_trips = self.trips.length
   return (total_cost - (num_trips * 1.65)) * .8
  end
end
