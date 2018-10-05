class Passenger < ApplicationRecord
  # QUESTION: BETTER TO NULLIFY OR DELETE??
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_spent
    user_trips = self.trips
    return user_trips.sum { |trip| trip.cost }
  end
end
