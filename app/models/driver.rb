class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify
  validates :vin, presence: true, uniqueness: true, length: { is: 17 }, format: { with: /\A[[a-zA-Z]||\d]{17}\z/, message: “Must be exactly 17 letter and digits” }
  validates :name, presence: true

  def total_earnings
  #The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
    total_cost = self.trips.reduce(0) { |sum, trip|
      if trip.cost == nil
        sum + 0
      else
        sum + trip.cost
      end
      }
    num_trips = self.trips.length
    total_earnings = ((total_cost - (num_trips * 1.65)) * 0.8) / 100
    return total_earnings.round(2)
  end

  def average_rating
    sum_rating = self.trips.reduce(0) { |sum, trip|
      if trip.rating == nil
        sum + 0
      else
        sum + trip.rating
      end
    }
    num_trips = self.trips.length.to_f
    if num_trips == 0
      return "- no trips -"
    else
      return '%.2f' % "#{sum_rating/num_trips}"
    end
  end

  def is_available?
    return self.trips.where(cost: nil).length == 0
  end

  def self.first_available
    return Driver.all.find { |driver| driver.is_available? }
  end

  def status
    if self.trips.any? { |trip| trip.cost == nil || trip.rating == nil }
      return :in_progress
    else
      return :available
    end
  end

end
