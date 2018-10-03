class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  #can you write these all in one line instead of individually?
  validates :passenger_id, presence: true
  validates :driver_id, presence: true
  validates :date, presence: true
  validates :rating, presence: true
  validates :cost, presence: true
end
