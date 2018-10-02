class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  # Not sure if we need a comma
end
