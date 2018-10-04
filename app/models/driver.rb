class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true

  # use scope to find active and drivers w/ available status
  # scope :active, -> { where(active: true) }
  # scope :active_and_status, -> { active.where(status: true) }

  def total_earnings
    total = 0
    self.trips.each do |trip|
      cost = trip.cost / 100
      total += (cost - 1.65) * 0.80
    end
    return total.round(2)
  end

  def average_rating
    sum = 0
    self.trips.each do |trip|
      sum += trip.rating
    end
    return (sum / self.trips.count).round(2)
  end

  def self.new_trip_driver
    avail_drivers = self.where(active: true, status: true)
    driver = avail_drivers.first
    driver.active = false
    driver.save
    # binding.pry
    return driver.id
  end
end
