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
    filtered_driver_params = driver_params
    @driver = Driver.new(filtered_driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end

    def edit
      @driver = Driver.find_by(id: params[:id])
    end

    def update
      driver = Driver.find(params[:id])
      if driver.update(driver_params)
        redirect_to driver_path(driver.id)
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
end
