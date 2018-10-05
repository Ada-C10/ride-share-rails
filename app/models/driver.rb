class Driver < ApplicationRecord
  has_many :trips

  def average_rating
    driver_trips = self.trips.where.not(rating: nil)

    sum = driver_trips.sum { |t| t.rating }.to_f

    return sum / driver_trips.length
  end
end
