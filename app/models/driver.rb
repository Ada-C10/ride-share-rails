class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true

  def total_revenue
    return self.trips.reduce(0) do |sum, trip|
      sum + ((trip.cost - 165)* 0.8)
    end
  end

  def average_rating
    total = self.trips.reduce(0) do |sum, trip|
      sum + trip.rating
    end
    return (total / self.trips.length)
  end
end
