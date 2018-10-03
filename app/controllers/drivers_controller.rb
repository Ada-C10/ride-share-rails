class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
  end

  def update
    driver = Driver.find(params[:id])

    result = driver.update(driver_params)

    if result
      redirect_to driver_path(driver.id)
    else
      render :edit
    end
  end

  private
  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin,
      :car_make,
      :car_model
    )
  end
end
