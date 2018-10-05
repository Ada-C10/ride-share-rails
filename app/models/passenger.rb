class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true, uniqueness: true

  def total_charged
    # if self.trip.cost  !=nil
      total = self.trips.reduce(0.0) { |sum, trip| sum + trip.cost }
      # total /= 100
    # end
  end
end
