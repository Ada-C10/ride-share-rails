class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true, format: {with: /\A[a-zA-Z\.\'\-]{2,50}(?: [a-zA-Z\.\'\-]{2,50})+\Z/}
  validates :phone_num, presence: true


  def is_in_ride?
    self.trips.each do |trip|
      if trip.rating == nil
        return true
      end
    end
    return false
  end
end
