class Driver < ApplicationRecord
  has_many :trips

  def list_trips
    return self.trips.where(driver_id: id)
  end

  def total_earnings
    driven_trips = list_trips
    raw_earnings = driven_trips.map { |trip| (trip.cost * 0.01 - 1.65)}
    total_earnings = raw_earnings.sum * 0.8
    return total_earnings.round(2)
  end


end
