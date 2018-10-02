class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  has_many :trips
end
