class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  def total_earnings
    total = 0
    self.trips.each do |trip|
      trip_price = (trip.cost - 1.65) * 0.80
      total += trip_price
    end
    return total
  end

  def average_rating
    total = 0
    self.trips.each do |trip|
      total += trip.rating
    end
    return (total.to_f / self.trips.length).round(2)
  end
end
