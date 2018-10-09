class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, presence: true
  validates :phone_num, presence: true

  def net_expenditures
    (trips.sum(&:cost).to_f) * 0.01
  end
end
