class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      head :not_found
    end
  end

  def update
    @driver = Driver.find(params[:id])

    if @driver.nil?
      head :not_found
    end

    is_updated = @driver.update(driver_params)

    if is_updated
      redirect_to driver_trips_path(@driver)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      head :not_found
    end

    if driver.destroy
      redirect_to drivers_path
    else
      render :show
    end
  end

  def assign_rating
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
    end

    @driver.update_attribute(:rating)

    redirect_to driver_trips_path
  end

  private

  def driver_params
    return params.require(:driver).permit(
      :name, :vin)
  end


end
