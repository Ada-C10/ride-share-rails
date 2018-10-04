class Driver < ApplicationRecord
  has_many :trips

  def average_rating

    return 0 if trips.length == 0

    total_rating = 0.0

    trips.each do |trip|
      total_rating += trip.rating
    end

    average_rating = total_rating / trips.length

    return average_rating
  end

  def total_earnings
    total_earnings = 0.0

    trips.each do |trip|
      total_earnings += trip.cost
    end

    total_earnings = (total_earnings * 0.8) - 1.65
    return total_earnings
  end

  def available_driver

    trip_with_rating = self.trips.where.not(rating: nil)

    first_available = trip_with_rating.first
    return first_available.driver_id
  end

end
