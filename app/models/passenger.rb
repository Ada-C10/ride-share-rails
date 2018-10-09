class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true


  def trip_sum
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost/100.00
    end
    return sum
  end

  #not needed can call just trips in view form
  def trip_list
    trips = self.trips
    if trips.length == 0
      return 0
    else
      return trips
    end
  end

end
