class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  def total_earned
    before_fees = (self.trips.reduce(0.0) { |sum, trip| sum + trip.cost }) / 100
    total = (before_fees - (self.trips.length * 1.65)) * 0.8

    return total.round(2)
  end

  def average_rating
      if self.trips.length < 1
        return average_rating = 0
      end
      completed_trips = self.trips.reject { |trip| trip.status == "In Progress"}
      sum_ratings = completed_trips.reduce(0.0){|memo, trip| memo + trip.rating}
      average_rating = (sum_ratings/self.trips.length).to_f.round(2)
      return average_rating
    end

  def self.find_driver
    @driver = self.find { |driver| driver.status == "AVAILABLE" }
  end

  def make_unavailable
    self.status = "UNAVAILABLE"
  end
end
