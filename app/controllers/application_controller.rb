class ApplicationController < ActionController::Base
  def find_available_driver
    drivers = Driver.all
    driver = drivers.find_by(available?: true)
    if driver
      driver.update(available?: false)
      driver.save
      return driver
    end
  end
  #application reponsible for setting up environ for app to run it
  #ie startign server
  #calling out initial data, loading css files 
end
