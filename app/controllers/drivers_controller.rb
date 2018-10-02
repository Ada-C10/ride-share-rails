class DriversController < ApplicationController

  def index
      @drivers = Driver.all
    end

    def show
      id = params[:id]
      @driver = Driver.find_by(id:id)
    end

    def create
    @driver = Driver.new(driver_params)
    if @driver.save

    else
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id].to_i)
  end

    def update
      @driver = Driver.find(params[:id].to_i)
      @driver.update(driver_params)
      driver_path(@driver)

    end

    def destroy
      driver = Driver.find_by(id: params[:id].to_i)
      @deleted_driver = driver.destroy
    end

    private

  def driver_params
    return params.require(:driver).permit(:name, :vin, :driver_picture)
  end


end
