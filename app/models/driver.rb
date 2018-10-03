class Driver < ApplicationRecord
  has_many :trips

  def self.next_available
    return Driver.where.not(id: Trip.where(rating: nil).select(:driver_id)).order("RANDOM()").first
  end
end
