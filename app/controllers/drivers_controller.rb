class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.new(driver_params)

    if driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      render :notfound, status: :not_found
    end
  end

  def update
    driver = Driver.find_by(id: params[:id])
    driver.update(driver_params)

    if driver.save
      redirect_to driver_path
    else
      render :edit
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])
    driver.active = false
    driver.status = false
    if driver.save
      redirect_to drivers_path
    end
  end

  private
  def driver_params
    return params.required(:driver).permit(:name, :vin)
  end
end
