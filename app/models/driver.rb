class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true

  has_many :trips

  def total_earnings
    return self.trips.sum { |trip| (trip.cost - 1.65) * 0.80 / 100}.round(2)
  end

  def average_rating
    rated_trips = self.trips.select { |trip| trip.rating }

    return (rated_trips.sum { |trip| trip.rating} * 1.0 / self.trips.length).round(1)
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

end
