class Driver < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: {is: 17}

  def average_rating
    return trips.sum(&:rating).to_f/ trips.length
  end

  def total_earnings
    total_profit = (trips.sum(&:cost).to_f) * 0.01
    driver_profit = (total_profit - 1.65) * 0.8
    return driver_profit
  end
end
