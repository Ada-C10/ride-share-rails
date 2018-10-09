class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    is_successful = @driver.save

    if is_successful
      redirect_to drivers_path
    else
      render :new , status: :bad_request
    end

  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    is_successful = @driver.update(driver_params)

    if is_successful
      redirect_to driver_path
    else
      render :edit , status: :bad_request
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])
    driver.destroy

    redirect_to drivers_path
  end

  def make_available
    @driver = Driver.find_by(id: params[:id])
    @driver.update(status: true)

    redirect_to driver_path

  end

  def make_unavailable
    @driver = Driver.find_by(id: params[:id])
    @driver.update(status: false)

    redirect_to driver_path
  end


  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
