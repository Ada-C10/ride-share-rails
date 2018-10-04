class Driver < ApplicationRecord
  # relation to trips
  has_many :trips

  # name must be unique and present
  validates :name, presence: true, uniqueness: true

  # vin must be unique and present
  validates :vin, presence: true, uniqueness: true

  def total_earnings
    if self.trips == []
      return 0
    else
      total = 0
      self.trips.each do |trip|
        cost = trip.cost / 100
        total += (cost - 1.65) * 0.80
      end
      return total
    end
  end

  def average_rating
    completed_trips = self.trips.where(in_progress: false)
    rating_sum = completed_trips.reduce(0) { |sum, trip| sum + trip.rating }
    
    return (rating_sum / completed_trips.count)
  end

  def self.new_trip_driver
    avail_drivers = self.where(active: true, status: true)
    driver = avail_drivers.first

    return driver.id
  end
end
