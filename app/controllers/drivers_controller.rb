class DriversController < ApplicationController
  def index
    @drivers = Driver.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @driver = Driver.find_by(id: params[:id])
    @trips = @driver.trips
    if @driver.nil?
      head :not_found
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
    driver = Driver.find(params[:id])
    if driver.update(driver_params)
      redirect_to drivers_path
    else
      head :not_acceptable
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    driver.destroy
    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin
    )
  end

end
