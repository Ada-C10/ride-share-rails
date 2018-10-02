class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers, through: :trips

  validates :name, presence: true
  validates :phone_num, numericality: { only_integer: true, greater_than: 7 }
end
