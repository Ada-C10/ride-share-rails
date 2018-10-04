class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  def index
    @drivers = Driver.paginate(:page => params[:page], :per_page => 20)
  end

  def show
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @driver.update(driver_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @driver.destroy
      redirect_to root_path
    end
  end


  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

  def set_driver
    @driver = Driver.find(params[:id])
  end

end
