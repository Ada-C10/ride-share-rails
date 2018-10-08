module TripsHelper

  def get_cost
    return rand(1000..9999)
  end

  def first_available_driver
    return Driver.find_by(status: true).id
  end
  # 
  # def change_driver_status
  #   self.driver.update_attribute = false
  # end

end
