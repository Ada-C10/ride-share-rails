class Passenger < ApplicationRecord
  has_many :trips
  has_many :drivers, through: :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  
end
