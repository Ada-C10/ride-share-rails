class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
  #The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
   total_cost = self.trips.reduce(0) { |sum, trip| sum + trip.cost }
   num_trips = self.trips.length
   total_earnings = ((total_cost - (num_trips * 1.65)) * 0.8) / 100
   return total_earnings.round(2)
  end

  def average_rating
    sum_rating = self.trips.reduce(0) { |sum, trip| sum + trip.rating }
    num_trips = self.trips.length.to_f
    return (sum_rating/num_trips).round(2)
  end

  def is_available?
    return driver.trips.where(cost: nil).length > 0
  end

end
