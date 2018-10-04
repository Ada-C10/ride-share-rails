class Passenger < ApplicationRecord
  # relation to trips
  has_many :trips

  # name must be unique and present
  validates :name, presence: true, uniqueness: true

  #phone num must be unique and present
  validates :phone_num, presence: true, uniqueness: true


  def total_cost
    unless self.trips == []
      total_cost = self.trips.reduce(0) { |sum, trip| sum + trip.cost }
      return total_cost
    else
      return 0
    end
  end

  def verify_trip
    if self.trips.last.cost == nil
      return false
    else
      return true
    end
  end


end
