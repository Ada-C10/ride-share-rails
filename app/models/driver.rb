class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  def amount_earned
    sum = 0
    self.trips.each do |trip|
      # converting cents to dollars
      cost = trip.cost
      cost = trip.convert_money(trip.cost)
      sum += cost
    end
    # Need help debuggin why it's returning the nonconverted answer 
    return (sum - 1.65) * 0.80
  end

  # Get amount driver earned
  # driver where id = driver.id
  # sum = 0
  # driver.trips.each do |trip|
    # sum += cost
    # end
    # minus a fee, multiply by .80
end
