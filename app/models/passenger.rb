class Passenger < ApplicationRecord
  has_many :trips

  def total_charged
    total = self.trips.reduce(0.0) { |sum, trip| sum + trip.cost }
    total /= 100
  end
end
