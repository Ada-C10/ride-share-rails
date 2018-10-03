class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def self.active_passenger
    return Passenger.all.select {|passenger| passenger.status == true}
  end

end
