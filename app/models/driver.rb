class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true
  has_many :trips

  FEE = 165
  PERCENTAGE = 0.80

  def total_earnings
    return self.trips.sum { |trip| trip.cost } * PERCENTAGE - FEE
  end

  def avg_rating
    return 1.0 * self.trips.sum{ |trip| trip.rating } / self.trips.length
  end
end
