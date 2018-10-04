require 'date'

class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers, through: :trips

  enum status: %i[inactive active]

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent
    total = 0
    trips.each do |trip|
      total += trip.cost
    end
    return total * 0.01
  end

  def all_passenger_trips
    trips
  end

  def assign_trip
    trip = Trip.new
    self.trips << trip
    Driver.all.sample.trips << trip
    trip.date = Date.today
    trip.rating = Random.rand(1..5)
    trip.cost = Random.rand(500..10000)
    trip.save
  end

end
