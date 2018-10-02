class Driver < ApplicationRecord
  has_many :trips

  def total_earnings
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end
    return total
  end

  def average_rating
    sum = 0
    self.trips.each do |trip|
      sum += trip.rating
    end
    return (sum / self.trips.count).round(2)
  end
end
