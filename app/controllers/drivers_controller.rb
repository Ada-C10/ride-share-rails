class DriversController < ApplicationController

  def index
    @drivers =  Driver.all.paginate(:page => params[:page]).order('id ASC')
  end

  def show
    @driver = Driver.find_by(id: params[:id])
    if @driver
      @trips = @driver.trips.all
    else
      redirect_to drivers, alert: "There are no drivers with that ID"
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
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def destroy
    @driver = Driver.find_by(id: params[:id])
    @driver.trips.delete_all
    if @driver
      @driver.destroy
    end
    redirect_to drivers_path
  end

  def change_status
    @driver = Driver.find_by(id: params[:id])
    @driver.toggle(:is_available).save
    redirect_to driver_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end
end
