class Trip < ApplicationRecord
  # relation to passengers and drivers
  belongs_to :passenger
  belongs_to :driver

  # date must be present
  validates :date, presence: true

  # passenger_id must be present
  validates :passenger_id, presence: true

  # driver_id must be present
  validates :driver_id, presence: true

  # cost must be present and numerical
  validates :cost, presence: true, numericality: true

  def end_trip(rating)
    driver = Driver.find(self.driver_id)
    if rating != nil
      self.in_progress = false
      self.cost = rand(9999) if self.cost == 0
      driver.status = true
      driver.save
    end
  end
end
