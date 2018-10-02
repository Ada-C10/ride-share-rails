class Trip < ApplicationRecord
  belongs_to :driver :passenger
  # Not sure if we need a comma
end
