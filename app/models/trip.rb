class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :date, presence: true
  validates :cost, numericality: true

  def find_driver
    drivers = Driver.all
    @driver = drivers.find { |driver| driver.status == "AVAILABLE" }
  end


end
