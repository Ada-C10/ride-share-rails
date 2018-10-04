class Passenger < ApplicationRecord
  has_many :trips

def all_trips
  @all_trips = []
  @all_trips << Trip.where(passenger_id: id)
  return @all_trips
end



end
