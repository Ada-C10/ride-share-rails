class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end
  def show
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
    head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render new_driver_path
    end
  end

  private


  def driver_params
    return params.require(:driver).permit(
    :name, :vin)
  end
end
