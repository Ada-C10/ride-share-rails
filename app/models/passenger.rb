class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers, through: :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent
    total = 0
    trips.each do |trip|
    total += trip.cost
    end
    return total
  end

  def all_passenger_trips
    trips.all
  end

end
