class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def available_driver

    driver_available = @drivers.where.not(rating: nil).first

    return driver_available
  end
end
