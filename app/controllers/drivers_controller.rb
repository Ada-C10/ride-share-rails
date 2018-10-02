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
  end

  def destroy
  end

  def update
  end

  private
  def driver_params
    return params.required(:driver).permit(:name, :vin)
  end
end
