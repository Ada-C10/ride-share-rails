class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)


    if @driver.nil?
     render :notfound, status: :not_found
    end
  end

  def edit
    @driver = Driver.find(params[:id].to_i)
  end

  def new
    @driver = Driver.new
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    if  @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :new
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id].to_i)
    @deleted_driver = driver.destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
