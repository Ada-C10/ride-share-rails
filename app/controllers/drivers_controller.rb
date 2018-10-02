class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id].to_i)
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

  def update
    @driver = Driver.find_by(id:params[:id])
    @driver.update(driver_params)
    if @driver.save
      redirect_to driver_path
    else
      render :new
    end
  end



  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
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
