class Driver < ApplicationRecord
  has_many :trips

  def all_trips
    @all_trips = []
    @all_trips << Trip.where(driver_id: id)
    return @all_trips
  end

  def average_rating
    rides = all_trips
    all_ratings = []

    rides.each do |ride|
      ride.each do |individual|

        if individual.rating != nil
          all_ratings << individual.rating
        end
      end
    end
    sum_ratings = all_ratings.sum
    average_rating = sum_ratings / all_ratings.length
    return average_rating

  end

  def total_earnings
    rides = all_trips
    profit_array = []

    rides.each do |ride|
      ride.each do |individual|

        if individual.cost != nil
          temp = individual.cost - 1.65
          profit_array << temp * 0.8
        end
      end
    end
    return profit_array.sum
  end
end
