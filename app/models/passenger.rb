class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :phone_num, presence: true
  has_many :trips

  def total_charges
    return self.trips.sum { |trip| trip.cost }
  end
end
