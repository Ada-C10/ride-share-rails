class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :date, presence: true
  validates :passenger_id, presence: true
  validates :driver_id, presence: true

  def format_cost
    return (cost / 100).round(2)
  end
end
