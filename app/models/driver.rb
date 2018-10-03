class Driver < ApplicationRecord
  has_many :trips
  has_many :passengers, through: :trips

  validates :name, presence: true
  validates :vin, presence: true

  def total_revenue
    total = 0
    trips.each do |trip|

      total += (trip.cost - 1.65)
    end
    return total_revenue = (total * 0.80)
  end

  def average_rating
    total = 0
    self.trips.each do |trip|
      total += trip.rating
    end
    return total/trips.count.to_f
  end
end
