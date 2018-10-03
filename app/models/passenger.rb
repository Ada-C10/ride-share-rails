require 'date'

class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers, through: :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def assign_trip
    trip = Trip.new
    self.trips << trip
    Driver.all.sample.trips << trip
    trip.date = Date.today
    trip.cost = Random.rand(0..9)
    trip.save
  end
end
