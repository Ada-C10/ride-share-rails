class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

<<<<<<< HEAD
=======
  def find_driver
    drivers = Driver.all
    @driver = drivers.find { |driver| driver.status == "AVAILABLE" }
  end


>>>>>>> d363c7532308fa953f669328870194f9427d2071
end
