class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @id = params[:id].to_i
    @driver = Driver.find_by(id: @id)
# See the driver's total earnings (-1.65, *.8)
# See the driver's average rating
  end

  def new
    @driver = Driver.new
# The user must provide a name and VIN
# Don't worry about how the VIN is formatted
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to driver_path(@driver.id) # unsure if need .to_i?
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    if task.update(driver_params)
      redirect_to driver_path(@driver.id) # unsure if need .to_i?
    end
  end

  def destroy
    driver = Driver.find_by(params[:id].to_i)
    driver.destroy
    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
