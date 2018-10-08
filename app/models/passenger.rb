class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify
  validates :phone_num, presence: true, uniqueness: { message: -> (object, data) do
        "must be unique - #{data[:value]} is taken by #{Passenger.where(phone_num: data[:value]).first.name}."
      end}
  validates :name, presence: true

  def total_cost
    #The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
     total_cost = self.trips.reduce(0) { |sum, trip|
       trip.cost == nil ? sum : sum + trip.cost }
     total_cost /= 100.0
     return total_cost.round(2)
  end

  def status
      # safer to base status on cost than rating, because cost is back-end and rating is user-enterd
    if self.trips.any? { |trip| trip.cost == nil }
      return :in_progress
    else
      return :available
    end
  end

end
