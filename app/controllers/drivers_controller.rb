class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find_by(id: id)

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
      redirect_to driver_path(driver.id)
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id].to_i)
  end

  def update
    driver = Passenger.find_by(id: params[:id].to_i)
    driver.update(driver_params)

    redirect_to driver_path(driver.id)
  end

  def destroy
    @deleted_driver = Driver.find_by(id: params[:id].to_i)
    @deleted_driver.destroy
  end

  private
    def driver_params
      return params.require(:driver).permit(:id, :name, :vin)
    end

end
