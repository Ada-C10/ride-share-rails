class Passenger < ApplicationRecord
  has_many :trips

  # The user must provide a name and phone number

end
