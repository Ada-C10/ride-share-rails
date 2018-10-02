class Driver < ApplicationRecord
  has_many :trips

  def total_earned
    before_fees = (self.trips.reduce(0.0) { |sum, trip| sum + trip.cost }) / 100
    total = (before_fees - (self.trips.length * 1.65)) * 0.8

    return total.round(2)
  end
end
