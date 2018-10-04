class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_charges
    trips = self.trips
    trips_total = 0
    trips.each do |trip|
      trips_total += trip.cost
    end
    return trips_total
  end

end
