class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  RATINGS = (1..5).to_a
end
