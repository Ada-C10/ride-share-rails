require 'date'

class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: { in: 17..17}
  def self.active_drivers
    return Driver.all.select {|driver| driver.status == true}
  end

  def self.random_active_driver
    drivers_picked = self.active_drivers.sample

    if drivers_picked != nil
      return drivers_picked
    else
      return nil
    end

  end

  def total_earning
    total = (self.trips.sum {|trip| (trip.cost-165)*0.8} )
    return total
  end

  def average_rate
    trip_with_rate = self.trips.select {|trip| trip.rating != nil}

    if trip_with_rate.nil? || trip_with_rate == []
      return nil
    else
      rate = trip_with_rate.sum {|trip| trip.rating} / trip_with_rate.length
      return rate.round(0)
    end
  end

end
