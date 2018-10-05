class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true, uniqueness: true, length: { in: 10..20 }

  def self.passenger_list
    return Passenger.all.map { |passenger| [passenger.name, passenger.id] }
  end

  def total_charged
    # if self.trip.cost  !=nil
      total = self.trips.reduce(0.0) { |sum, trip| sum + trip.cost }
      # total /= 100
    # end
  end
end
