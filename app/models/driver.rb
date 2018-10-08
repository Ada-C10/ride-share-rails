DRIVERS_CUT = 0.8
FEE = 1.65

class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true, format: {with: /\A[a-zA-Z\.\'\-]{2,50}(?: [a-zA-Z\.\'\-]{2,50})+\Z/}
  validates :vin, presence: true, format: {with: /[A-HJ-NPR-Z0-9]/i}, length: { is: 17 }

  self.per_page = 10

  def toggle_availablity
    self.toggle(:is_available).save
  end

  def self.first_available_driver
    return Driver.find_by(is_available: true)
  end

  def total_earnings
    total_earnings = self.trips.sum do |trip|
      trip_cost = trip.cost
      (trip_cost - FEE) * DRIVERS_CUT
    end
    return total_earnings
  end

  def average_rating
    ratings = self.trips.map { |trip| trip.rating  }
    ratings_sum = ratings.compact.sum { | rating| rating }
    return ratings_sum / self.trips.length
  end
end
