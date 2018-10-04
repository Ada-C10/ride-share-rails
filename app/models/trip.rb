class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def driver_name
    return self.driver.name
  end

  def passenger_name
    return  self.passenger.name
  end

  def status
    if self.rating == nil
      return :in_progress
    else
      return :complete
    end
  end

  def formatted_cost
    return "%.2f" % "#{self.cost/100.0}"
  end

end
