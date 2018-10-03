class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true, format: {with: /\A[a-zA-Z\.\'\-]{2,50}(?: [a-zA-Z\.\'\-]{2,50})+\Z/}
  validates :vin, presence: true, format: {with: /[A-HJ-NPR-Z0-9]/i}, length: { is: 17 }

  self.per_page = 10

  def toggle_availablity
    self.toggle(:is_available?).save
  end

  def self.first_available_driver
    return Driver.find_by(is_available?: true)
  end

  def total_earnings
    total_earnings = self.trips.sum{ | trip | (trip.cost - 1.65) * 0.80 }
    return total_earnings
  end
end
