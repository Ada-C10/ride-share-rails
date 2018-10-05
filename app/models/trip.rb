class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  #helper method for create trip
  def self.find_available_driver
    drivers = Driver.all
    driver = drivers.find_by(available?: true)
    if driver
      driver.update(available?: false)
      driver.save
      return driver
    end
  end
end
