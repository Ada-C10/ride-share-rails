class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def assign_driver
   available_drivers = Driver.where(avaialble: true)
   driver = available_drivers.first
   return driver
 end
end
