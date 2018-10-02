class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
    total = 0
    all_trips = self.trips
    all_trips.each do |trip|
      total += trip.cost
    end
    return total
  end
end
