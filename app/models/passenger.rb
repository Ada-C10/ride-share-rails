class Passenger < ApplicationRecord
  has_many :trips

  def total_spending
    (self.trips.sum(:cost))/100.to_f

  end
end
