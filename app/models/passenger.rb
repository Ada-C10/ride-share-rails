class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true, length: { in: 10..25 }

  def self.active_passenger

    return Passenger.all.select {|passenger| passenger.status == true}
  end

  def total_spending
    total = self.trips.sum {|trip| trip.cost}
    return total
  end

end
