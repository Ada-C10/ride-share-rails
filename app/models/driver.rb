class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  has_many :trips

  def total_earnings
    total = 0
    self.trips.each do |trip|
      total += trip.cost
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


end
