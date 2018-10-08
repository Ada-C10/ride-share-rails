class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    @id = params[:id].to_i
    @driver = Driver.find_by(id: @id)

    if @driver.nil?
      render :notfound, status: :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to driver_path(@driver.id) # unsure if need .to_i?
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id].to_i)
  end

  def update
    @driver = Driver.find_by(id: params[:id].to_i)
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id) # unsure if need .to_i?
    end
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
