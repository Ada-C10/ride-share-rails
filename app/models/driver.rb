class Driver < ApplicationRecord
  validates_presence_of :name, :vin

  has_many :trips, dependent: :nullify

  def total_earnings
    total = 0
    self.trips.each do |trip|
      total += ((trip.cost - 165) * 0.8).round(0)
    end

    return total
  end

  def average_rating
    sum = 0
    self.trips.each do |trip|
      sum += trip.rating
    end
    return (sum.to_f / self.trips.length).round(1)
  end

  def is_available?
    return false if self.trips.any? {|trip| trip.rating == nil}
    return true
  end
end
