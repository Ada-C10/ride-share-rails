class Driver < ApplicationRecord
  has_many :trips
  has_many :passengers, through: :trips

  def average_rating
    counter = 0
    rating = 0
    self.trips.each do |trip|
      rating += trip.rating
      counter += 1
    end
    return (rating.to_f/counter).round(2) 
  end
end
