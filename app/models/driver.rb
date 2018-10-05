class Driver < ApplicationRecord
  has_many :trips

  def all_trips
    temp_trips = []
    all_trips = []
    temp_trips << Trip.where(driver_id: id)
    temp_trips.each do |trips|
      trips.each do |trip|
        all_trips << trip
      end
    end
    return all_trips
  end

  def average_rating
    trips = all_trips
    all_ratings = []

    trips.each do |trip|
      if trip.rating != nil
        all_ratings << trip.rating
      end
    end
    sum_ratings = all_ratings.sum
    average_rating = sum_ratings / all_ratings.length
    return average_rating
  end

  def total_earnings
    trips = all_trips
    profit_array = []

    trips.each do |trip|
      temp = trip.cost - 165
      profit_array << temp * 0.8
    end
    return profit_array.sum
  end
end
