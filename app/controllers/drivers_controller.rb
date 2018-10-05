class DriversController < ApplicationController
  def index
    @drivers = Driver.order("name").page(params[:page]).per_page(7)
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

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    driver = Driver.find_by(id: params[:id])
    if driver.update(driver_params)
      redirect_to driver_path(driver)
    else
      render new_driver_path(driver)
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])
    if driver.destroy
      redirect_to drivers_path
    #else
    end
  end

  private

  def driver_params
    return params.require(:driver).permit(
    :name, :vin, :available?)
  end
end
