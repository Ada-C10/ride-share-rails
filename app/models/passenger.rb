class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :phone_num, presence: true
  has_many :trips

  def amt_charged
    return self.trips.sum { |trip| trip.cost } * 1.0 / 100
  end

  def self.search(search)
  where("name ILIKE ?", "%#{search}%")
  end
end
