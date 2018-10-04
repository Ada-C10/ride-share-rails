class Driver < ApplicationRecord
  has_many :trips
  # validates :name, presence: true
  # validates :vin, presence: true

  def self.next_available
    return Driver.where.not(id: Trip.where(rating: nil).select(:driver_id)).order("RANDOM()").first
  end

  def total_earnings
    total_earnings = 0

    self.trips.each do |trip|
      earned = (trip.cost * 0.8) - 1.65
      total_earnings += earned
    end
    return total_earnings
  end

  def average_rating
    ratings = []
    self.trips.each do |trip|
      ratings << trip.rating
    end
    average_rating = ratings.sum / ratings.length
    return average_rating
  end

end
