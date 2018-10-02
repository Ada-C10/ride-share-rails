class Driver < ApplicationRecord
  has_many :trips
  has_many :passengers, through: :trips

  validates :name, presence: true
  validates :vin, presence: true
end
