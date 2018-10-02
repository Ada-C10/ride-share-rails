class DriversController < ApplicationController
  # create routes

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def new
    @driver = Driver.new
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
