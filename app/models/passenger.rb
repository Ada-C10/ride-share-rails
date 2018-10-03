class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_expenditures
    return self.trips.reduce(0) do |sum, trip|
      sum + trip.cost
    end
  end

end
