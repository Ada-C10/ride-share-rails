class Passenger < ApplicationRecord
  has_many :trips
  validates :phone_num, presence: true

  def net_expenditures
    trips.sum(&:cost)
  end
end
