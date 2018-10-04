class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true, length: {is: 17}

  def average_rating
    trips.sum(&:rating).to_f/ trips.length
  end

  def total_earnings
    trips.sum(&:cost)
  end
end
