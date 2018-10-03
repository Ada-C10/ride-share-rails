class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def total_charged
    charged = 0
    self.trips.each do |trip|
      charge = trip.convert_money(trip.cost)
      charged += charge 
    end
    return charged
  end

end
