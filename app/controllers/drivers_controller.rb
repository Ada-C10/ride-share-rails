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

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
