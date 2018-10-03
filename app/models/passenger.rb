class Passenger < ApplicationRecord
  has_many :trips

  def net_expenditures
    trips.sum(&:cost)
  end
end
