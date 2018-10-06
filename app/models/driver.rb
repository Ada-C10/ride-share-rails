class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, :vin, presence: true, uniqueness: true

  def average_rating
    driver_trips = self.trips.where.not(rating: nil)

    sum = driver_trips.sum { |t| t.rating }.to_f

    return sum / driver_trips.length
  end

  def total_earnings
    driver_cut = 0.8

    trips_cost = self.trips.where.not(cost: nil)

    earnings_minus_fee = trips_cost.map { |t| t.cost - 165 }

    calculated_earnings = earnings_minus_fee.reduce(:+)

    return calculated_earnings * driver_cut
  end

end
