class DriversController < ApplicationController
  # create routes
  def index
    @driver = Driver.all
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)
    if @driver.nil?
      render :notfound, status: :notfound
    end
  end

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

  def destroy
    driver = Driver.find_by(id: params[:id].to_i)
    # infom user: you tried to delete a driver who has a trip (currently driving) , you can't delete it because of foreing key currently attached to trip
    # destroy action throws an error exception, so you can't use if statement, you have to rescue that exception
    begin
      driver.destroy
      redirect_to drivers_path
    rescue
      render :deletewarning
    end
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
