class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true

  def total_revenue
    return self.trips.reduce(0) do |sum, trip|
      sum + ((trip.cost - 165)* 0.8)
    end
  end

  def average_rating

    total_length = self.trips.length

    total = self.trips.reduce(0) do |sum, trip|
      if trip.rating == nil
        total_length -=1
      else
        sum + trip.rating
      end
    end

    return (total / total_length)
  end

end
