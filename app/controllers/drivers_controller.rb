class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def destroy
    driver = Driver.find_by(id: params[:id])
    driver.destroy
    redirect_to root_path
  end

  def create
    filtered_params = driver_params()
    @driver = Driver.new(filtered_params)
    save_success = @driver.save
    if save_success
      redirect_to drivers_path
    else
      render :new
    end
  end

  def show
    driver_id = params[:id]
    @driver= Driver.find_by(id: driver_id)
    if @driver.nil?
      head :not_found
    end
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update(driver_params)
    redirect_to drivers_path
  end

  private

  def book_params
    return params.require(:driver).permit(
      :name,
      :vin
    )
  end

end
