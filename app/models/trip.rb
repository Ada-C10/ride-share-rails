class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

 #  def assign_driver
 #   available_drivers = Driver.where(available: true)
 #   driver = available_drivers.sample
 #   # driver.available = false
 #   return driver
 # end

  # def rating_completed?
  #
  #
  # end
end
