class Trip < ApplicationRecord
  validates :driver_id, :passenger_id, :date, :cost, presence: true

  belongs_to :driver
  belongs_to :passenger

end
