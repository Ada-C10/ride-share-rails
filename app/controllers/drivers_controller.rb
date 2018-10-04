class DriversController < ApplicationController
  def index
    if params[:trip_id]
      trip = Trip.find_by(id: params[:trip_id])
      @drivers = trip.drivers
    else
      @drivers = Driver.all
    end
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      puts "#{@driver.errors}"
      render :new
    end
  end

  def edit
    if params[:trip_id]
      trip = Trip.find_by(id: params[:trip_id])
      @driver = trip.drivers.new
    else
      @driver = Driver.find_by(id: params[:id].to_i)
    end 
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    if @driver.update(driver_params)
      redirect_to driver_path
    else
      render :edit
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id].to_i)
    driver.destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
