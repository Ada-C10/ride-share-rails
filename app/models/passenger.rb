class Passenger < ApplicationRecord
  # relation to trips
  has_many :trips

  # name must be unique and present
  validates :name, presence: true, uniqueness: true

  #phone num must be unique and present
  validates :phone_num, presence: true, uniqueness: true


  def total_cost
    finished_trips
    binding.pry
    unless self.trips.empty?
      total_cost = self.trips.reduce(0) { |sum, trip| sum + trip.cost }
  
      return total_cost
    else
      return 0
    end

  end

end
