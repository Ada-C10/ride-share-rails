class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
    # @trips = Trip.where(driver_id: driver_id)
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
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
  end

  def update
    @driver = Driver.find(params[:id])

    result = @driver.update(driver_params)

    if result
      redirect_to drivers_path
    else
      render :edit
    end
  end

  def availability
    @driver = Driver.find_by(id: params[:driver_id])
    is_available = @driver.available

    if is_available
      @driver.update(available: false)
    else
      @driver.update(available: true)
    end

    redirect_to driver_trips_path(@driver.id)
  end

  def destroy
    @driver = Driver.find_by(id: params[:id])

    if @driver
      @driver.destroy
      redirect_to drivers_path
    else
      return head :not_found
    end

  end

  private
  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin,
      :car_make,
      :car_model
    )
  end
end
