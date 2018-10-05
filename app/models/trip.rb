class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  def find_driver
    drivers = Driver.all
    @driver = drivers.find { |driver| driver.status == "AVAILABLE" }
  end


end
