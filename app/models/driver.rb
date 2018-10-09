class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify 
  has_many :passengers, through: :trips

  validates :name, presence: true
  validates :vin, presence: true

  def average_rating
    counter = 0
    rating = 0
    self.trips.each do |trip|
      rating += trip.rating
      counter += 1
    end
    return (rating.to_f/counter).round(2)
  end

  def total_earnings
    sum = 0
    self.trips.each do |trip|
      sum += ((trip.cost - 165) * 0.8)
    end
    return sum
  end

  def list_trips
    trips = []
    self.trips.each do |trip|
      if trip.driver_id == self.id
        trips << trip
      end
    end
    return trips
  end
end
