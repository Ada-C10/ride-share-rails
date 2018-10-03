class Passenger < ApplicationRecord
  has_many :trips

  def active_passengers
    return @passenger.select {|passenger| passenger.status == true}
  end
end
