class Driver < ApplicationRecord
  has_many :trips
  # validates :name, presence: true
  # validates :vin, presence: true

  def self.next_available
    return Driver.where.not(id: Trip.where(rating: nil).select(:driver_id)).order("RANDOM()").first
  end

  def self.total_earnings
  end

  def self.average_rating
  end

end
