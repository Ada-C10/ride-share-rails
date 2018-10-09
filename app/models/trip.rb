class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates :rating, presence: true
  validates :cost, presence: true
  validates :driver_id, presence: true
  validates :passenger_id, presence: true


  def passenger_name
    passenger = self.passenger
    if passenger
      return passenger.name
    else
      return "unkown"
    end
  end

  def driver_name
    driver = self.driver
    if driver
      return driver.name
    else
      return "unkown"
    end
  end

end
