class Driver < ApplicationRecord
  has_many :trips

  def average_rating
    total_rating = 0.0

    trips.each do |trip|
      total_rating += trip.rating.to_i
    end

    average_rating = total_rating / trips.length

    return average_rating
  end

  def total_cost
    total_cost = 0.0

    trips.each do |trip|
      total_cost += trip.cost.to_i
    end

    return total_cost
  end
end
