class Passenger < ApplicationRecord
  validates :name, :phone_num, presence: true

  has_many :trips, dependent: :nullify

  def total_charges
    sum = 0
    self.trips.each do |trip|
      sum += trip.cost
    end
    sum
  end

  # def create_trip
  #   driver = Driver.order("RANDOM()").limit(1)
  #   @trip_hash = {driver_id: driver, passenger_id: self.id, date: DateTime.now, cost: rand(1..5000)}
  # end

end
