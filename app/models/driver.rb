class Driver < ApplicationRecord
  has_many :trips, :dependent => :nullify

  validates :name, :vin, presence: true
  validates :vin, length: { minimum: 17 }

  def average_rating

    return 0 if trips.length == 0

    total_rating = 0.0

    trips.each do |trip|
      if trip.rating != nil
        total_rating += trip.rating
      end
    end

    average_rating = total_rating / trips.length

    return average_rating
  end

  def total_earnings
    total_earnings = 0.0

    trips.each do |trip|
      if trip.cost != nil
        total_earnings += trip.cost
      end
    end

    total_earnings = (total_earnings * 0.8) - 1.65
    return total_earnings
  end

  def self.available_driver
    available_drivers = Driver.where(available: true)
    driver = available_drivers.sample
    return driver
  end

  def change_status

    update(available: false)
  end
end
